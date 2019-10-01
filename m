From: dwlsalmeida at gmail.com (Daniel W. S. Almeida)
Date: Mon, 30 Sep 2019 21:58:51 -0300
Subject: [Linux-kernel-mentees] [PATCH] drm: i915: fix kernel-doc warnings
	in i915_drv.h
Message-ID: <20191001005851.276806-1-dwlsalmeida@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida at gmail.com>

The warnings were generated due to missing or misplaced characters.
Now fixed. No other change in content.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida at gmail.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 772154e4073e..941f60304932 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1126,7 +1126,7 @@ struct i915_perf_stream {
 	struct i915_oa_config *oa_config;
 
 	/**
-	 * The OA context specific information.
+	 * @pinned_ctx: The OA context specific information.
 	 */
 	struct intel_context *pinned_ctx;
 	u32 specific_ctx_id;
@@ -1140,7 +1140,7 @@ struct i915_perf_stream {
 	int period_exponent;
 
 	/**
-	 * State of the OA buffer.
+	 * @oa_buffer: State of the OA buffer.
 	 */
 	struct {
 		struct i915_vma *vma;
@@ -1150,7 +1150,7 @@ struct i915_perf_stream {
 		int format_size;
 		int size_exponent;
 
-		/**
+		/*
 		 * Locks reads and writes to all head/tail state
 		 *
 		 * Consider: the head and tail pointer state needs to be read
@@ -1172,7 +1172,7 @@ struct i915_perf_stream {
 		 */
 		spinlock_t ptr_lock;
 
-		/**
+		/*
 		 * One 'aging' tail pointer and one 'aged' tail pointer ready to
 		 * used for reading.
 		 *
@@ -1184,18 +1184,18 @@ struct i915_perf_stream {
 			u32 offset;
 		} tails[2];
 
-		/**
+		/*
 		 * Index for the aged tail ready to read() data up to.
 		 */
 		unsigned int aged_tail_idx;
 
-		/**
+		/*
 		 * A monotonic timestamp for when the current aging tail pointer
 		 * was read; used to determine when it is old enough to trust.
 		 */
 		u64 aging_timestamp;
 
-		/**
+		/*
 		 * Although we can always read back the head pointer register,
 		 * we prefer to avoid trusting the HW state, just to avoid any
 		 * risk that some hardware condition could * somehow bump the
-- 
2.23.0
