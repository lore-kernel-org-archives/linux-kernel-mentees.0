Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E4EC6FA8B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Sep 2022 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EF9A40C79;
	Tue, 20 Sep 2022 19:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EF9A40C79
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RBtwoayj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EuMT9Fcrxwai; Tue, 20 Sep 2022 19:51:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 16BDB4013D;
	Tue, 20 Sep 2022 19:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16BDB4013D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4038C0032;
	Tue, 20 Sep 2022 19:51:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9594C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Sep 2022 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7086F60F42
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Sep 2022 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7086F60F42
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=RBtwoayj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHowehjkBl_L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Sep 2022 19:51:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A068260F3B
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A068260F3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Sep 2022 19:51:16 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id b75so3730683pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Sep 2022 12:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=DTuwHmur8BQ7UzvYXiSfhG6hoCLOFlEZLc+v/yhwyjc=;
 b=RBtwoayj+pMK/J5jSI0mvoHQG0BJON5T+gf4rKX8Rq65AY9XUeli1UUam9cEOdwCAC
 x8gHFCFL/icqEGcNeWXHYdTE02bXSyc+MV5I6e+kPHCYobDuk8E18tp7lCpTuJHGrllN
 fbxAe321lGeeHrzc+Ra82RYS1HVvMLDfTirYcgq/8rboWH0JckIn6jecDWxBKEDr/SGw
 i0Vquzu9V1zci54lVCEK9NvAHru6Jcbfa3XI7Y1FLDGHulIX+dwJ1kLrCyBMkOuqvzfw
 2oK92I1Bd+apQXpZ6IMsdy7zCALZAtqKt4nDiO7GtPdba0vXE4LR7n8j8mDCrSyBDLl8
 jDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=DTuwHmur8BQ7UzvYXiSfhG6hoCLOFlEZLc+v/yhwyjc=;
 b=POQoDV4E9qcbLf/VIz2oGH0kxgKyh44grjNsGC6nK1rLOU6VknHiNWClZkiaaMQnCO
 yXdacFTHpU7cXeII3CyHGzkvwFc3Vm1gDNupS9cUu4D9PVswKNDfVeeSC3h817t3uioo
 6u7zM4jyjzvWNjVny6YDtXjCWdnlBiWQtpf4TTK1egrRH+9XnTrENMvGLgUeg/DiMy8G
 20scHN/ZRHplECgF3EKkSdUjmLmIpdZizScq469Q9qzKZitf64Bk3oA0W2ujoslkn2Gk
 XLUJvEQUohZQguq2Uldndacna+RI6Af1zKR2jJGWWUAn5A5Ai6M8ihSdhQNyu74GN/oD
 pilA==
X-Gm-Message-State: ACrzQf2vrWXRxmrMPhmP5HiGQKMjFSgahjRkcFOY03lWLAGtPR+qeraa
 HF4+cgv7CRli8tNcleT/tXPDvw==
X-Google-Smtp-Source: AMsMyM7jex9Q5arTcLqho5hOOC6Z04y67nCb26iNt51DRVTZbuq+ew/XjLCTxS9HZwnDheQ8q64NMw==
X-Received: by 2002:a63:1455:0:b0:438:e26b:ab1f with SMTP id
 21-20020a631455000000b00438e26bab1fmr20977346pgu.183.1663703475946; 
 Tue, 20 Sep 2022 12:51:15 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 m1-20020a17090a7f8100b002008ba3a74csm256802pjl.52.2022.09.20.12.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:51:15 -0700 (PDT)
Date: Tue, 20 Sep 2022 19:51:11 +0000
To: Gautam Menghani <gautammenghani201@gmail.com>
Subject: Re: [PATCH] selftests/kvm: Use num_vcpus when testing ICR in the
 xapic_state_test
Message-ID: <YyoZr9rXSSMEtdh5@google.com>
References: <20220903073901.73862-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903073901.73862-1-gautammenghani201@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 guang.zeng@intel.com, pbonzini@redhat.com, shuah@kernel.org
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

On Sat, Sep 03, 2022, Gautam Menghani wrote:
> A TODO in xapic_state_test asks to use number of vCPUs instead of
> vcpu.id + 1 in test_icr(). This patch adds support to get the number 
> of vCPUs from the VM created and use it.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  .../selftests/kvm/x86_64/xapic_state_test.c     | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86_64/xapic_state_test.c b/tools/testing/selftests/kvm/x86_64/xapic_state_test.c
> index 6f7a5ef66718..de934e8e5e41 100644
> --- a/tools/testing/selftests/kvm/x86_64/xapic_state_test.c
> +++ b/tools/testing/selftests/kvm/x86_64/xapic_state_test.c
> @@ -96,9 +96,8 @@ static void __test_icr(struct xapic_vcpu *x, uint64_t val)
>  	____test_icr(x, val & ~(u64)APIC_ICR_BUSY);
>  }
>  
> -static void test_icr(struct xapic_vcpu *x)
> +static void test_icr(struct xapic_vcpu *x, int num_vcpus)
>  {
> -	struct kvm_vcpu *vcpu = x->vcpu;
>  	uint64_t icr, i, j;
>  
>  	icr = APIC_DEST_SELF | APIC_INT_ASSERT | APIC_DM_FIXED;
> @@ -110,11 +109,11 @@ static void test_icr(struct xapic_vcpu *x)
>  		__test_icr(x, icr | i);
>  
>  	/*
> -	 * Send all flavors of IPIs to non-existent vCPUs.  TODO: use number of
> -	 * vCPUs, not vcpu.id + 1.  Arbitrarily use vector 0xff.
> +	 * Send all flavors of IPIs to non-existent vCPUs. Arbitrarily use vector 0xff.
>  	 */
> +
>  	icr = APIC_INT_ASSERT | 0xff;
> -	for (i = vcpu->id + 1; i < 0xff; i++) {
> +	for (i = num_vcpus; i < 0xff; i++) {

Hrm, this is a bad TODO, which is 100% my fault.  I think past me wanted to play
nice with the possibility of creating multiple vCPUs, but using the number of
vCPUs to do that is the wrong approach as it makes assumptions on the vcpu_id.
One of the goals of the refactoring that led to vm_create_with_one_vcpu() was
to have tests stop making assumptions about vCPU IDs.

What would make sense though is to not assume vcpu_id == 0, i.e.

	if (i = 0; i < 0xff; i++) {
		if (i == vcpu->id)
			continue;

		for (j = 0; j < 8; j++)
			__test_icr(x, i << (32 + 24) | icr | (j << 8));

	}

>  		for (j = 0; j < 8; j++)
>  			__test_icr(x, i << (32 + 24) | icr | (j << 8));
>  	}
> @@ -137,9 +136,13 @@ int main(int argc, char *argv[])
>  		.is_x2apic = true,
>  	};
>  	struct kvm_vm *vm;
> +	struct list_head *iter;
> +	int nr_vcpus_created = 0;
>  
>  	vm = vm_create_with_one_vcpu(&x.vcpu, x2apic_guest_code);
> -	test_icr(&x);
> +	list_for_each(iter, &vm->vcpus)
> +		nr_vcpus_created++;
> +	test_icr(&x, nr_vcpus_created);

Computing the number of vCPUs created is rather silly, the test _knows_ that it
has created exacty one vCPU.  Should be a moot point though.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
