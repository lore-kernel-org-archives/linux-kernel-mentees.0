Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B32BC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Jul 2022 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A504241D;
	Thu,  7 Jul 2022 23:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A504241D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aYs3bZQ1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6wUbrF7bEvC; Thu,  7 Jul 2022 23:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 61D0642418;
	Thu,  7 Jul 2022 23:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61D0642418
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F14FC0035;
	Thu,  7 Jul 2022 23:10:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 662A7C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 23:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E774019F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 23:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E774019F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=aYs3bZQ1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXisoeqrVPAG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 23:10:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FC4D4014B
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FC4D4014B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Jul 2022 23:10:55 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso241695pjc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 07 Jul 2022 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TqoITV2pKW32A4dt41SN4K/+XbRSwwvZNic7w5oXhBA=;
 b=aYs3bZQ1BCJjjPgBnSRGEbYaFkv+Iv8EEgeOrHKNmoqqEiSsZ0LdFntkloSGbcUeUU
 fiJGTQ28PCl7Xn2j8DwMdxNYmLnKoroRrcA27UO9bNBKSStsrGG1cKHfJBBHW3jm1xyx
 URvyw5cWZ+5kBh1emLqGyhQXGVptCWZhAQrt2DFw8ufP1eA598eMG4zaF6Qo2IXjV+ze
 Kz11jUYpa5gt+XubsghdEqVLuTNSF16rESYQO6Hd+b3KwkcwlEZ3UCmSEls3dxXmWOLv
 sDrLZudS/HntODg5hMKDeCp9zlcxNcvN01iz1xzuXct6/WYslFmfOaJUmR7j5Q3R4NO7
 h7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TqoITV2pKW32A4dt41SN4K/+XbRSwwvZNic7w5oXhBA=;
 b=UcCDp4uFFfl84MFIhaG/gyEE7nErXdeT4w3VQMSszf1lVeR302DgIlcpPObyRBc2MH
 uEcNA1pkdXHp7/QBl81RB2E/HZI8rkg35ny544VfzVtwtblfDvBBHqo72Dqt2pTAxVws
 5Ur1wPycIgk+nrISLo/0ZYnILC6yhvuC7AHMOygnnCoQY8rJ7m5h/J9QS/UYL1RF2IJu
 VYkK4H03lMrKTazVOgYIozgIsfVeBNRkIex7XmvGXq0p8Q9f7H+qkjlc2NQBZLU8VGvq
 8ICosU8beLOnITctm1Y696AbdDk3FuthYKqcX2Oq64iAWbcPhkXfG0btKz4+xg9UDqeI
 BcXQ==
X-Gm-Message-State: AJIora+EuZnRBkJEXDyNIRtM/6f4SwryQFwWGetHsjoiLGvj4XleG5/J
 7B+hmr/+TyqpgnD79fwD+0jkSw==
X-Google-Smtp-Source: AGRyM1uZIJNZXUsYe+zR0XtBe4h3Xn2PoOIdAia3O5yVwvGe6Wp2msoXjkxftcPAEWGr9UWTwdot4Q==
X-Received: by 2002:a17:90b:1c02:b0:1ed:4bfb:7772 with SMTP id
 oc2-20020a17090b1c0200b001ed4bfb7772mr8300513pjb.139.1657235455012; 
 Thu, 07 Jul 2022 16:10:55 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 l189-20020a6225c6000000b005255263a864sm27556291pfl.169.2022.07.07.16.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 16:10:54 -0700 (PDT)
Date: Thu, 7 Jul 2022 23:10:50 +0000
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH] selftests/kvm: Add error messages before skipping tests
 in vm_xsave_req_perm()
Message-ID: <Ysdn+ia40BSKnXU+@google.com>
References: <20220704163538.31165-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704163538.31165-1-gautammenghani201@gmail.com>
Cc: yang.zhong@intel.com, kvm@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 peterx@redhat.com, wei.w.wang@intel.com, linux-kselftest@vger.kernel.org,
 guang.zeng@intel.com, dmatlack@google.com, pbonzini@redhat.com,
 vkuznets@redhat.com, shuah@kernel.org, jmattson@google.com
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jul 04, 2022, Gautam Menghani wrote:
> Add messages in the checks that are performed before making a request
> with ARCH_REQ_XCOMP_GUEST_PERM.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> index ead7011ee8f6..c74e846661b7 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
> @@ -643,11 +643,15 @@ void vm_xsave_req_perm(int bit)
>  	if (rc == -1 && (errno == ENXIO || errno == EINVAL))
>  		exit(KSFT_SKIP);
>  	TEST_ASSERT(rc == 0, "KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) error: %ld", rc);
> -	if (!(bitmask & (1ULL << bit)))
> +	if (!(bitmask & (1ULL << bit))) {
> +		print_skip("Userspace address of attr data is blank");
>  		exit(KSFT_SKIP);
> +	}
>  
> -	if (!is_xfd_supported())
> +	if (!is_xfd_supported()) {
> +		print_skip("XFD is not supported");
>  		exit(KSFT_SKIP);
> +	}

This is no longer necessary as of commit 7ed397d107d4 ("KVM: selftests: Add
TEST_REQUIRE macros to reduce skipping copy+paste"), which will automagically
print the missing requirement before calling exit().

Thanks much for the patch though!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
