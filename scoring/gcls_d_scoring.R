# GCLS-D scoring (R)
# Erwartet standardmäßig Itemspalten gcls_01 ... gcls_38 (Werte 1-5).
# Unterstützt auch 0-4 Skala: setze scale_min = 0, scale_max = 4.

gcls_d_reverse_items <- c(3, 5, 10, 31, 32, 33, 34, 35, 36, 37, 38)

gcls_d_subscales <- list(
  Psychological_Functioning = c(1, 2, 4, 6, 7, 8, 9, 11, 12, 13),
  Genitalia = c(14, 21, 25, 26, 27, 29),
  Social_Gender_Role_Recognition = c(16, 19, 20, 22),
  Physical_and_Emotional_Intimacy = c(3, 5, 32, 33),
  Chest = c(15, 18, 28, 30),
  Other_Secondary_Sex_Characteristics = c(17, 23, 24),
  Life_Satisfaction = c(10, 31, 34, 35, 36, 37, 38)
)

gcls_d_detect_item_cols <- function(df) {
  # Prefer gcls_01..gcls_38; otherwise accept G1..G5 + g6..g38 pattern
  cols_a <- sprintf("gcls_%02d", 1:38)
  if (all(cols_a %in% names(df))) return(cols_a)

  cols_b <- c(sprintf("G%d", 1:5), sprintf("g%d", 6:38))
  if (all(cols_b %in% names(df))) return(cols_b)

  stop("Keine passende Item-Spaltenstruktur gefunden. Erwartet gcls_01..gcls_38 oder G1..G5 + g6..g38.")
}

gcls_d_reverse_score <- function(x, scale_min, scale_max) {
  ifelse(is.na(x), NA, scale_max + scale_min - x)
}

gcls_d_score <- function(df,
                         item_cols = NULL,
                         scale_min = 1,
                         scale_max = 5,
                         min_valid_prop = 0.5) {
  if (is.null(item_cols)) item_cols <- gcls_d_detect_item_cols(df)

  out <- df

  # build numeric item matrix in item order 1..38
  X <- as.data.frame(lapply(item_cols, function(cn) suppressWarnings(as.numeric(df[[cn]]))))
  names(X) <- sprintf("i%02d", 1:38)

  # reverse items
  for (i in gcls_d_reverse_items) {
    nm <- sprintf("i%02d", i)
    X[[nm]] <- gcls_d_reverse_score(X[[nm]], scale_min = scale_min, scale_max = scale_max)
  }

  # helper: mean with min valid prop
  mean_min_valid <- function(mat, idx) {
    sub <- mat[, idx, drop = FALSE]
    n_items <- length(idx)
    n_valid <- rowSums(!is.na(sub))
    ok <- n_valid >= ceiling(n_items * min_valid_prop)
    m <- rowMeans(sub, na.rm = TRUE)
    m[!ok] <- NA_real_
    m
  }

  # subscales
  for (nm in names(gcls_d_subscales)) {
    idx <- gcls_d_subscales[[nm]]
    cols <- sprintf("i%02d", idx)
    out[[paste0("gcls_", nm)]] <- mean_min_valid(X, cols)
  }

  # optional clusters
  out$gcls_Gender_Congruence <- mean_min_valid(X, sprintf("i%02d", 14:30))
  out$gcls_Mental_Wellbeing_and_Life_Satisfaction <- mean_min_valid(X, c(sprintf("i%02d", 1:13), sprintf("i%02d", 31:38)))

  # also provide overall mean (all 38)
  out$gcls_TotalMean <- mean_min_valid(X, sprintf("i%02d", 1:38))

  out
}

