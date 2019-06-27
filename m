From: skhan@linuxfoundation.org (Shuah Khan)
Date: Wed, 26 Jun 2019 21:33:43 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] drm/amdkfd: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627032532.18374-3-c0d1n61at3@gmail.com>
References: <20190627010137.5612-3-c0d1n61at3@gmail.com>
	<20190627032532.18374-3-c0d1n61at3@gmail.com>
Message-ID: <59d3169d-4c74-4e75-7a48-93c0e99ae1f2@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627033343.wohZJRZ0ptNoF9hKfdyLNj6ZrScXo8pXQDIc_1K6Ql8@z>

On 6/26/19 9:25 PM, Jiunn Chang wrote:
> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> significant bit to unsigned.
> 
> Changes included in v2:
>    - use subsystem specific subject lines
>    - CC required mailing lists
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---

Move version change lines here.

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

thanks,
-- Shuah
