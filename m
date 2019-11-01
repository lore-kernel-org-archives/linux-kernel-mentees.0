From: jaskaransingh7654321@gmail.com (Jaskaran Singh)
Date: Fri, 1 Nov 2019 22:08:56 +0530
Subject: [Linux-kernel-mentees] [PATCH] drivers: gpu: drm: amd: amdgpu: Add
 @level to amdgpu_vm_bo_param documentation
Message-ID: <20191101163856.GA13800@localhost.localdomain>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191101163856.3F5OmnL7r2msGkX6Uq2u6M5v3C__vPrvpXj9Jl6c9BQ@z>

The documentation for this function is missing the function parameter
"level", so add it. This fixes the following warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:821:
	warning: Function parameter or member 'level'
	not described in 'amdgpu_vm_bo_param'

Signed-off-by: Jaskaran Singh <jaskaransingh7654321 at gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5251352f5922..6f6a9be11d84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -813,6 +813,7 @@ static int amdgpu_vm_clear_bo(struct amdgpu_device *adev,
  *
  * @adev: amdgpu_device pointer
  * @vm: requesting vm
+ * @level: VMPT level
  * @bp: resulting BO allocation parameters
  */
 static void amdgpu_vm_bo_param(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.21.0
