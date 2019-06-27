From: skhan at linuxfoundation.org (Shuah Khan)
Date: Wed, 26 Jun 2019 19:18:13 -0600
Subject: [Linux-kernel-mentees] [PATCH] uapi: linux: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627010137.5612-3-c0d1n61at3@gmail.com>
References: <20190627010137.5612-1-c0d1n61at3@gmail.com>
	<20190627010137.5612-3-c0d1n61at3@gmail.com>
Message-ID: <996f87d1-a301-6b30-5d74-7d9be070000c@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/26/19 7:01 PM, Jiunn Chang wrote:
> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> significant bit to unsigned.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>   include/uapi/linux/kfd_ioctl.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index dc067ed0b72d..ae5669272303 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -339,7 +339,7 @@ struct kfd_ioctl_acquire_vm_args {
>   #define KFD_IOC_ALLOC_MEM_FLAGS_USERPTR		(1 << 2)
>   #define KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL	(1 << 3)
>   /* Allocation flags: attributes/access options */
> -#define KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE	(1 << 31)
> +#define KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE	(1U << 31)
>   #define KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE	(1 << 30)
>   #define KFD_IOC_ALLOC_MEM_FLAGS_PUBLIC		(1 << 29)
>   #define KFD_IOC_ALLOC_MEM_FLAGS_NO_SUBSTITUTE	(1 << 28)
> 

Hi Jiunn,

cc mailing lists.

-- Shuah
