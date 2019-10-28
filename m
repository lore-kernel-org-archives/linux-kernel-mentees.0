From: madhuparnabhowmik04 at gmail.com (madhuparnabhowmik04@gmail.com)
Date: Mon, 28 Oct 2019 11:34:43 +0530
Subject: [Linux-kernel-mentees] [PATCH] Drivers: gpu: drm: amd: display:
	amdgpu_dm: amdgpu_dm.h: Fixed a documentation warning
Message-ID: <20191028060443.14997-1-madhuparnabhowmik04@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191028060443.fpPGwsBnHsu4AYv0WOWJnCrhviPE4bZG5tThzQb_tjg@z>

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patch fixes the following  warning: Incorrect use of
 kernel-doc format:          * @atomic_obj
by adding a colon after @atomic_obj.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index c8c525a2b505..80d53d095773 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -128,7 +128,7 @@ struct amdgpu_display_manager {
 	u16 display_indexes_num;
 
 	/**
-	 * @atomic_obj
+	 * @atomic_obj:
 	 *
 	 * In combination with &dm_atomic_state it helps manage
 	 * global atomic state that doesn't map cleanly into existing
-- 
2.17.1
