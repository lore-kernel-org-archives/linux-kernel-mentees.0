Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CB9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 16:08:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5262076B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 16:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5262076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 97CE78879B;
	Sat,  1 Aug 2020 16:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddByYbSqtHbQ; Sat,  1 Aug 2020 16:08:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1D2DF8879A;
	Sat,  1 Aug 2020 16:08:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06251C0050;
	Sat,  1 Aug 2020 16:08:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DB31C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 16:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E86418831B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 16:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMW4iKByqgpC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 16:08:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by hemlock.osuosl.org (Postfix) with ESMTP id 82DA98830C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 16:08:21 +0000 (UTC)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 4C44372CCE9;
 Sat,  1 Aug 2020 19:08:19 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 3AB947CFC00; Sat,  1 Aug 2020 19:08:19 +0300 (MSK)
Date: Sat, 1 Aug 2020 19:08:19 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200801160818.GB4964@altlinux.org>
References: <20200801020841.227522-1-yepeilin.cs@gmail.com>
 <20200801152044.230416-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801152044.230416-1-yepeilin.cs@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel@vger.kernel.org, Elvira Khabirova <lineprinter@altlinux.org>,
 linux-api@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Eugene Syromyatnikov <evgsyr@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] ptrace: Prevent
 kernel-infoleak in ptrace_get_syscall_info()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Aug 01, 2020 at 11:20:44AM -0400, Peilin Ye wrote:
> ptrace_get_syscall_info() is potentially copying uninitialized stack
> memory to userspace, since the compiler may leave a 3-byte hole near the
> beginning of `info`. Fix it by adding a padding field to `struct
> ptrace_syscall_info`.
> 
> Cc: stable@vger.kernel.org
> Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v3:
>     - Remove unnecessary `__aligned__` attribute. (Suggested by
>       Dmitry V. Levin <ldv@altlinux.org>)
> 
> Change in v2:
>     - Add a padding field to `struct ptrace_syscall_info`, instead of
>       doing memset() on `info`. (Suggested by Dmitry V. Levin
>       <ldv@altlinux.org>)
> 
> Reference: https://lwn.net/Articles/417989/
> 
> $ # before:
> $ pahole -C "ptrace_syscall_info" kernel/ptrace.o
> struct ptrace_syscall_info {
> 	__u8                       op;                   /*     0     1 */
> 
> 	/* XXX 3 bytes hole, try to pack */
> 
> 	__u32                      arch __attribute__((__aligned__(4))); /*     4     4 */
> 	__u64                      instruction_pointer;  /*     8     8 */
> 	__u64                      stack_pointer;        /*    16     8 */
> 	union {
> 		struct {
> 			__u64      nr;                   /*    24     8 */
> 			__u64      args[6];              /*    32    48 */
> 		} entry;                                 /*    24    56 */
> 		struct {
> 			__s64      rval;                 /*    24     8 */
> 			__u8       is_error;             /*    32     1 */
> 		} exit;                                  /*    24    16 */
> 		struct {
> 			__u64      nr;                   /*    24     8 */
> 			__u64      args[6];              /*    32    48 */
> 			/* --- cacheline 1 boundary (64 bytes) was 16 bytes ago --- */
> 			__u32      ret_data;             /*    80     4 */
> 		} seccomp;                               /*    24    64 */
> 	};                                               /*    24    64 */
> 
> 	/* size: 88, cachelines: 2, members: 5 */
> 	/* sum members: 85, holes: 1, sum holes: 3 */
> 	/* forced alignments: 1, forced holes: 1, sum forced holes: 3 */
> 	/* last cacheline: 24 bytes */
> } __attribute__((__aligned__(8)));
> $
> $ # after:
> $ pahole -C "ptrace_syscall_info" kernel/ptrace.o
> struct ptrace_syscall_info {
> 	__u8                       op;                   /*     0     1 */
> 	__u8                       pad[3];               /*     1     3 */
> 	__u32                      arch;                 /*     4     4 */
> 	__u64                      instruction_pointer;  /*     8     8 */
> 	__u64                      stack_pointer;        /*    16     8 */
> 	union {
> 		struct {
> 			__u64      nr;                   /*    24     8 */
> 			__u64      args[6];              /*    32    48 */
> 		} entry;                                 /*    24    56 */
> 		struct {
> 			__s64      rval;                 /*    24     8 */
> 			__u8       is_error;             /*    32     1 */
> 		} exit;                                  /*    24    16 */
> 		struct {
> 			__u64      nr;                   /*    24     8 */
> 			__u64      args[6];              /*    32    48 */
> 			/* --- cacheline 1 boundary (64 bytes) was 16 bytes ago --- */
> 			__u32      ret_data;             /*    80     4 */
> 		} seccomp;                               /*    24    64 */
> 	};                                               /*    24    64 */
> 
> 	/* size: 88, cachelines: 2, members: 6 */
> 	/* last cacheline: 24 bytes */
> };
> $ _
> 
>  include/uapi/linux/ptrace.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
> index a71b6e3b03eb..83ee45fa634b 100644
> --- a/include/uapi/linux/ptrace.h
> +++ b/include/uapi/linux/ptrace.h
> @@ -81,7 +81,8 @@ struct seccomp_metadata {
>  
>  struct ptrace_syscall_info {
>  	__u8 op;	/* PTRACE_SYSCALL_INFO_* */
> -	__u32 arch __attribute__((__aligned__(sizeof(__u32))));
> +	__u8 pad[3];
> +	__u32 arch;
>  	__u64 instruction_pointer;
>  	__u64 stack_pointer;
>  	union {

Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>

Thanks,


-- 
ldv
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
