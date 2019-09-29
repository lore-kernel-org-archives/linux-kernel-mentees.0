From: jaskaransingh7654321@gmail.com (Jaskaran Singh)
Date: Sun, 29 Sep 2019 13:19:19 +0530
Subject: [Linux-kernel-mentees] [PATCH] drm/i915: Fix documentation build
	warnings w/r/t kernel-doc
Message-ID: <20190929074919.GA5699@localhost.localdomain>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190929074919.47lLGPbFu1Q_M4NM8jf0sE8BuKlvy-zIPFgwNROzZuo@z>

Building docs with make htmldocs yields documentation build
warnings for drivers/gpu/drm/i915/i915_drv.h. Some of the
documentation does not follow kernel-doc format.

This patch fixes these warnings.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321 at gmail.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 772154e4073e..573a972e3643 100644
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
@@ -1151,7 +1151,7 @@ struct i915_perf_stream {
 		int size_exponent;
 
 		/**
-		 * Locks reads and writes to all head/tail state
+		 * @ptr_lock: Locks reads and writes to all head/tail state
 		 *
 		 * Consider: the head and tail pointer state needs to be read
 		 * consistently from a hrtimer callback (atomic context) and
@@ -1173,8 +1173,8 @@ struct i915_perf_stream {
 		spinlock_t ptr_lock;
 
 		/**
-		 * One 'aging' tail pointer and one 'aged' tail pointer ready to
-		 * used for reading.
+		 * @tails: One 'aging' tail pointer and one 'aged' tail pointer
+		 * ready to used for reading.
 		 *
 		 * Initial values of 0xffffffff are invalid and imply that an
 		 * update is required (and should be ignored by an attempted
@@ -1185,22 +1185,24 @@ struct i915_perf_stream {
 		} tails[2];
 
 		/**
-		 * Index for the aged tail ready to read() data up to.
+		 * @aged_tail_idx: Index for the aged tail ready to read() data
+		 * up to.
 		 */
 		unsigned int aged_tail_idx;
 
 		/**
-		 * A monotonic timestamp for when the current aging tail pointer
-		 * was read; used to determine when it is old enough to trust.
+		 * @aging_timestamp: A monotonic timestamp for when the current
+		 * aging tail pointer was read; used to determine when it is old
+		 * enough to trust.
 		 */
 		u64 aging_timestamp;
 
 		/**
-		 * Although we can always read back the head pointer register,
-		 * we prefer to avoid trusting the HW state, just to avoid any
-		 * risk that some hardware condition could * somehow bump the
-		 * head pointer unpredictably and cause us to forward the wrong
-		 * OA buffer data to userspace.
+		 * @head: Although we can always read back the head pointer
+		 * register, we prefer to avoid trusting the HW state, just to
+		 * avoid any risk that some hardware condition could * somehow
+		 * bump the head pointer unpredictably and cause us to forward
+		 * the wrong OA buffer data to userspace.
 		 */
 		u32 head;
 	} oa_buffer;
-- 
2.21.0
