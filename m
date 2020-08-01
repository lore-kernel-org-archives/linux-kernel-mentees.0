Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C565C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 15:09:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDEE5207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 15:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaWHYaZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDEE5207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ADFA0886D2;
	Sat,  1 Aug 2020 15:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xbowRK3A-O7; Sat,  1 Aug 2020 15:09:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28081886D1;
	Sat,  1 Aug 2020 15:09:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13771C004F;
	Sat,  1 Aug 2020 15:09:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EAEBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 39E3A886D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmS8d3Y-34Ke
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:09:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 473D9886CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:09:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o22so24990901qtt.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AnUnEw7ce9H3qhe28a6R96K/BnlU0zb3g4leH5fYies=;
 b=IaWHYaZMB5TD+ZQcsllGb890DGQ658jE5DNKFYFaUPNsRW3ushkrkDfszkG+JwLfVT
 +DzHKRueuVVmG27M8CPJD+rGbb1T0yMJm+Fv+nfJLi+rDE1UaYbJucTI3yDXr7Renj9L
 659GJwCDctmyZ1N6NXXIlnLivYkuXXVXUXA3bxUVNC0X7GO/svm13WfelQGvCTCCbuNd
 sm6jls2Ql0UXm14BgPgt3SIjYWu4WmXf8DmMpVjvADqIGHY1Db/axR2Rzq5N7FWm9csT
 uRG4gh8n+PeionvH7r+6CHH9Ex4tNTkk47JTyyz6avJ7Vmdpp5U/W53a8sLLfQJEvYJH
 6uiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AnUnEw7ce9H3qhe28a6R96K/BnlU0zb3g4leH5fYies=;
 b=hk4xDFNt9Na8qlHTjRPd4S45sEh/TbkRuJpnIUmRGbm2bqbgK8BKym1+lB5dNVAAo7
 Pen2rt8g4jyFahm1NebHHq/vIv7EZ8hNjvcZA8FevJumPrU2VFxs4pvUVyGN2AeHRNMK
 Ysepzi5AzGLqAp+AT8RSoU17d4i/gcMDsBGqmoCJyI6NB/A/aGztZk4Lq5MnzAV8QwD+
 nIJqEc8nYoU3/3aq1CXMLjeRYrg5JkPaYKdl48tT5J8BeTGNBa/07oZYsN8lNBta2/oo
 2z1W/sxfH8grs+lhyFm6g+5VK9vXGojQLBzbkTv6Bz1yI9JqjgIiZy7I6RnQdKGHN5ch
 z8wQ==
X-Gm-Message-State: AOAM532OqzPJprJT5aa56NFg5vHYzAQWr9mckmKTLRTdQvqpToTM6piv
 Qvsd7/UKkrYSJW5/9Dtd7A==
X-Google-Smtp-Source: ABdhPJwVrd8QjBPMSvl4se7MrhK152HJ7JbrprmBFUZb5nWD8fw1Ls3Gv2euWj8SmTqBJwDRXlex5w==
X-Received: by 2002:ac8:4558:: with SMTP id z24mr9131991qtn.241.1596294566246; 
 Sat, 01 Aug 2020 08:09:26 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id p4sm12300599qkj.135.2020.08.01.08.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 08:09:25 -0700 (PDT)
Date: Sat, 1 Aug 2020 11:09:19 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: "Dmitry V. Levin" <ldv@altlinux.org>
Message-ID: <20200801150919.GA229082@PWN>
References: <20200727213644.328662-1-yepeilin.cs@gmail.com>
 <20200801020841.227522-1-yepeilin.cs@gmail.com>
 <20200801110646.GA1705@altlinux.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801110646.GA1705@altlinux.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel@vger.kernel.org, Elvira Khabirova <lineprinter@altlinux.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Eugene Syromyatnikov <evgsyr@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] ptrace: Prevent
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

On Sat, Aug 01, 2020 at 02:06:46PM +0300, Dmitry V. Levin wrote:
> On Fri, Jul 31, 2020 at 10:08:41PM -0400, Peilin Ye wrote:
> > ptrace_get_syscall_info() is potentially copying uninitialized stack
> > memory to userspace, since the compiler may leave a 3-byte hole near the
> > beginning of `info`. Fix it by adding a padding field to `struct
> > ptrace_syscall_info`.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >     - Add a padding field to `struct ptrace_syscall_info`, instead of
> >       doing memset() on `info`. (Suggested by Dmitry V. Levin
> >       <ldv@altlinux.org>)
> > 
> > Reference: https://lwn.net/Articles/417989/
> > 
> > $ # before:
> > $ pahole -C "ptrace_syscall_info" kernel/ptrace.o
> > struct ptrace_syscall_info {
> > 	__u8                       op;                   /*     0     1 */
> > 
> > 	/* XXX 3 bytes hole, try to pack */
> > 
> > 	__u32                      arch __attribute__((__aligned__(4))); /*     4     4 */
> > 	__u64                      instruction_pointer;  /*     8     8 */
> > 	__u64                      stack_pointer;        /*    16     8 */
> > 	union {
> > 		struct {
> > 			__u64      nr;                   /*    24     8 */
> > 			__u64      args[6];              /*    32    48 */
> > 		} entry;                                 /*    24    56 */
> > 		struct {
> > 			__s64      rval;                 /*    24     8 */
> > 			__u8       is_error;             /*    32     1 */
> > 		} exit;                                  /*    24    16 */
> > 		struct {
> > 			__u64      nr;                   /*    24     8 */
> > 			__u64      args[6];              /*    32    48 */
> > 			/* --- cacheline 1 boundary (64 bytes) was 16 bytes ago --- */
> > 			__u32      ret_data;             /*    80     4 */
> > 		} seccomp;                               /*    24    64 */
> > 	};                                               /*    24    64 */
> > 
> > 	/* size: 88, cachelines: 2, members: 5 */
> > 	/* sum members: 85, holes: 1, sum holes: 3 */
> > 	/* forced alignments: 1, forced holes: 1, sum forced holes: 3 */
> > 	/* last cacheline: 24 bytes */
> > } __attribute__((__aligned__(8)));
> > $
> > $ # after:
> > $ pahole -C "ptrace_syscall_info" kernel/ptrace.o
> > struct ptrace_syscall_info {
> > 	__u8                       op;                   /*     0     1 */
> > 	__u8                       pad[3];               /*     1     3 */
> > 	__u32                      arch __attribute__((__aligned__(4))); /*     4     4 */
> > 	__u64                      instruction_pointer;  /*     8     8 */
> > 	__u64                      stack_pointer;        /*    16     8 */
> > 	union {
> > 		struct {
> > 			__u64      nr;                   /*    24     8 */
> > 			__u64      args[6];              /*    32    48 */
> > 		} entry;                                 /*    24    56 */
> > 		struct {
> > 			__s64      rval;                 /*    24     8 */
> > 			__u8       is_error;             /*    32     1 */
> > 		} exit;                                  /*    24    16 */
> > 		struct {
> > 			__u64      nr;                   /*    24     8 */
> > 			__u64      args[6];              /*    32    48 */
> > 			/* --- cacheline 1 boundary (64 bytes) was 16 bytes ago --- */
> > 			__u32      ret_data;             /*    80     4 */
> > 		} seccomp;                               /*    24    64 */
> > 	};                                               /*    24    64 */
> > 
> > 	/* size: 88, cachelines: 2, members: 6 */
> > 	/* forced alignments: 1 */
> > 	/* last cacheline: 24 bytes */
> > } __attribute__((__aligned__(8)));
> > $ _
> > 
> >  include/uapi/linux/ptrace.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
> > index a71b6e3b03eb..a518ba514bac 100644
> > --- a/include/uapi/linux/ptrace.h
> > +++ b/include/uapi/linux/ptrace.h
> > @@ -81,6 +81,7 @@ struct seccomp_metadata {
> >  
> >  struct ptrace_syscall_info {
> >  	__u8 op;	/* PTRACE_SYSCALL_INFO_* */
> > +	__u8 pad[3];
> >  	__u32 arch __attribute__((__aligned__(sizeof(__u32))));
> >  	__u64 instruction_pointer;
> >  	__u64 stack_pointer;
> 
> Funnily enough, but in first editions of PTRACE_GET_SYSCALL_INFO
> patchset [1] this was looking very similar:
> 
> +struct ptrace_syscall_info {
> +	__u8 op;        /* PTRACE_SYSCALL_INFO_* */
> +	__u8 __pad0[3];
> +	__u32 arch;
> 
> But later we decided [2][3] to replace the pad with a hole.
> 
> Note that the sole purpose of the __aligned__ attribute on the field that
> follows the hole is to guarantee that the hole has the same size across
> architectures.  As this hole is being replaced back with a pad, that
> __aligned__ attribute is no longer needed and can be omitted along with
> adding the pad.

Ah, I see. I will remove that in v3.

Thank you,
Peilin Ye

> [1] https://lore.kernel.org/linux-api/20181125022150.46258a20@akathisia/
> [2] https://lore.kernel.org/linux-api/20181211162305.GA480@altlinux.org/
> [3] https://lore.kernel.org/linux-api/20181213171833.GA5240@altlinux.org/
> 
> 
> -- 
> ldv
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
