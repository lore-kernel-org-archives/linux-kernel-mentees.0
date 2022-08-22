Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BABC28D13
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 08:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B496B4054E;
	Mon, 22 Aug 2022 08:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B496B4054E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W9Bhg7iS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQ8NgnwAsUi5; Mon, 22 Aug 2022 08:49:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7AEFE40993;
	Mon, 22 Aug 2022 08:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AEFE40993
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57715C0032;
	Mon, 22 Aug 2022 08:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4BF6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9719C408D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9719C408D3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W9Bhg7iS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJxOFP1WwziI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:49:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AF6C400D2
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AF6C400D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:49:37 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso9878530pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=iCDhhI8vpKAF6ccQbhIqtzhgqF2l3okiXUrZiiXnnm0=;
 b=W9Bhg7iSBNOgvnU4J2cCOmqNHfLa6kD+gS/Usqk3AknhHc4v+WiAGy+JIEpPk93F0v
 ZshHrlelmZNNgf8KNqLcb2tdv1RVNyQ8n2r9V1LafUXbS29Nfdmtx3Bk4T2UYNjQbWdQ
 IROe8E7Zl0eewBHK1sXgs9MmGbJECKFYcUSw81vfilrCvGg+ZbUA4gOLuTUO6Q7BEYJe
 MN+Wo90tD7jV4sH/X4vyuwR3x5Dph7r+EdaKdioVD6yx07RcnroQp+rGacCErIWwFtuE
 QhTbdQdv1J//jmz2eZQHWOI5vKSy3TwcG8mOESrZt1vrbVa3t25yUqVLuSQfBzvMQnt4
 I0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=iCDhhI8vpKAF6ccQbhIqtzhgqF2l3okiXUrZiiXnnm0=;
 b=IWPczECJmph1Ge+CjPce1zQGnMzZmQigvDBPsEO43bCxUslELtWNXqXM6gsofk5kP6
 yQR/Q8Isc3Wzo36yv5Sxc2kOH9803bfl/upGdIKYsGNyF9tPZrxy0TIURWPGKk3IoZUa
 5Cbj9SWkODTQJDs1h1doWORZUIvtAI535GCtcDYwhwePmvkRL/epfW6tHHopfCj2R7Bi
 H0AHQtcfBUys+Aq00AqmxOulqY0OFwpWagv5U1bwAUYQ0Fq/1qOnqDmwuKpHCbxhUZ5D
 RYfTrnNi4ja+f7R5bxAmF20Yptdgzw+93/X0kt8mybNJKA9CgNLPPO7on4cYex09YxRG
 LhHA==
X-Gm-Message-State: ACgBeo0Bha2MnnfCI0NqpNzmm90wsB8OJrm5ByMmbMtVVIVIo6X6ginU
 89X5CJzv7q7NNrYKCYCNvPU=
X-Google-Smtp-Source: AA6agR6cvVQaqLj53v88y85bXAGnA2dBM9QOcc34rNSyJrlGP9xIQiKAtSUBCGRWwgaBCUY9lmf8Ow==
X-Received: by 2002:a17:903:2602:b0:172:ba94:1590 with SMTP id
 jd2-20020a170903260200b00172ba941590mr17217787plb.146.1661158177309; 
 Mon, 22 Aug 2022 01:49:37 -0700 (PDT)
Received: from fedora ([103.230.148.185]) by smtp.gmail.com with ESMTPSA id
 c2-20020a634e02000000b00401a9bc0f33sm6874136pgb.85.2022.08.22.01.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 01:49:36 -0700 (PDT)
Date: Mon, 22 Aug 2022 14:19:28 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: keescook@chromium.org, shuah@kernel.org, brauner@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 guoren@kernel.org
Subject: Re: [PATCH] selftests/seccomp: Check CAP_SYS_ADMIN capability in the
 test mode_filter_without_nnp
Message-ID: <YwNDGAVrik3DvWZf@fedora>
References: <20220731092529.28760-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731092529.28760-1-gautammenghani201@gmail.com>
Cc: wad@chromium.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 luto@amacapital.net, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, bpf@vger.kernel.org
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

On Sun, Jul 31, 2022 at 02:55:29PM +0530, Gautam Menghani wrote:
> In the "mode_filter_without_nnp" test in seccomp_bpf, there is currently
> a TODO which asks to check the capability CAP_SYS_ADMIN instead of euid.
> This patch adds support to check if the calling process has the flag 
> CAP_SYS_ADMIN, and also if this flag has CAP_EFFECTIVE set.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 136df5b76319..16b0edc520ef 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -392,6 +392,8 @@ TEST(mode_filter_without_nnp)
>  		.filter = filter,
>  	};
>  	long ret;
> +	cap_t cap = cap_get_proc();
> +	cap_flag_value_t is_cap_sys_admin = 0;
>  
>  	ret = prctl(PR_GET_NO_NEW_PRIVS, 0, NULL, 0, 0);
>  	ASSERT_LE(0, ret) {
> @@ -400,8 +402,8 @@ TEST(mode_filter_without_nnp)
>  	errno = 0;
>  	ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog, 0, 0);
>  	/* Succeeds with CAP_SYS_ADMIN, fails without */
> -	/* TODO(wad) check caps not euid */
> -	if (geteuid()) {
> +	cap_get_flag(cap, CAP_SYS_ADMIN, CAP_EFFECTIVE, &is_cap_sys_admin);
> +	if (!is_cap_sys_admin) {
>  		EXPECT_EQ(-1, ret);
>  		EXPECT_EQ(EACCES, errno);
>  	} else {
> -- 
> 2.34.1
> 

Hi,

Please review the above patch and let me know if any changes are required.

Thanks,
Gautam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
