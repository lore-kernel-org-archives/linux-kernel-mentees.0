From: jaskaransingh7654321@gmail.com (Jaskaran Singh)
Date: Fri, 1 Nov 2019 21:34:54 +0530
Subject: [Linux-kernel-mentees] [PATCH] drivers: gpu: amdgpu: Remove @dev
 from amdgpu_gem_prime_export documentation
Message-ID: <20191101160454.GA11565@localhost.localdomain>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191101160454.75yMxdmHf0nf6zx1YEKAWBmh-rpvx4aNfrysXMShkgY@z>

The function does not have a "dev" argument, so remove it from
the documentation. This fixes the following documentation
build warning:

./drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:335:
	warning: Excess function parameter 'dev' description in
	'amdgpu_gem_prime_export'

Signed-off-by: Jaskaran Singh <jaskaransingh7654321 at gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 61f108ec2b5c..4917b548b7f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -321,7 +321,6 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 
 /**
  * amdgpu_gem_prime_export - &drm_driver.gem_prime_export implementation
- * @dev: DRM device
  * @gobj: GEM BO
  * @flags: Flags such as DRM_CLOEXEC and DRM_RDWR.
  *
-- 
2.21.0
