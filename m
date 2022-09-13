Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7DEC6FA82
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Sep 2022 16:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C7CA40AE2;
	Tue, 13 Sep 2022 16:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7CA40AE2
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Eonuy6tP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBCQ8D8YYlnm; Tue, 13 Sep 2022 16:19:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 96A2740AE7;
	Tue, 13 Sep 2022 16:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96A2740AE7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B68CC0033;
	Tue, 13 Sep 2022 16:19:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B34E8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Sep 2022 16:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9555381839
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Sep 2022 16:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9555381839
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Eonuy6tP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snwzacHS8Ven
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Sep 2022 16:19:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C8F8149C
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1C8F8149C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Sep 2022 16:19:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k21so1794393pls.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Sep 2022 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=JRpSe51gO9elcRpNLQ13XpR1BjhyoW7VoSIpUC+x7RI=;
 b=Eonuy6tP0PQq6FJE+yAdGYE4n7+/QEnfURtlysVXZkisYqC6MQK8pg4FSKqNDfNend
 OeX/Tu38DpQzJf/kaFZkBZgFegcxev/dClMV7FHVh7bO9ezKK+2I92MkHjic6QqaIiH2
 wMM5mt1u0ueFdumkSmKOV/boMIur2vQLfPICJOUl7LjeBk9QhuIggiewGGVlfhRdpCNy
 SYCXv0IV9Kd8C03Dx2kHyy5W36X83WC6mjHzGw/mKaGP9yc0hCY/JyHyAHP2sOnC43Le
 gQ2Cok7GMNbUgE/a3EkIOr2FBDLWzHcxkpa4J886i3fVUPYH2oww+ylvu9LjSOmWw7/0
 a4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=JRpSe51gO9elcRpNLQ13XpR1BjhyoW7VoSIpUC+x7RI=;
 b=PHf/pVBYulne/jfbK5t7R1aY9IB30GMZJ9oLuferdxiPqkEXneMGwJ7X2qrJ1/spls
 jgJfwtFRuuTv0LieKTxEUT2StDtIoPl/+PImwLhtmK0RTqwua6+FyHzIIofiXiduZIF2
 5GI2Cj/LgeywwH5TXYlWhSLopM+EA+qmhJX4VdUXqT+ndMPIDcAwp7ygDW8pqfuASFN6
 YnPpTfoAk4VgUYmgYAAMw7rXElOZm3RRrgUvzyBkTkf5tN+jEYyuJyu/UAN1sc+1Q6S5
 tqwFwJBw2kJzP5cHZk1HF2pnPFzVNBruljGWaGMrRJ3m3vLjMgsc5xfUsqR4cDKZHjLa
 uHCg==
X-Gm-Message-State: ACrzQf1lMWcDxMiol792tm8psNxExdqP68I7mHPZHcFLAu4HVFJjrD9o
 qVM62ljxwYuSref6QlGwAsk=
X-Google-Smtp-Source: AMsMyM5t1BxKo7mB4oo2cqqSwlWl3t+9pzST0FUwIknMPIUKkYQGfi4+HWWZNiyQ/6X522JJR731MA==
X-Received: by 2002:a17:90a:e60c:b0:202:6ef8:4b52 with SMTP id
 j12-20020a17090ae60c00b002026ef84b52mr81315pjy.236.1663085956264; 
 Tue, 13 Sep 2022 09:19:16 -0700 (PDT)
Received: from biggie ([103.230.148.187]) by smtp.gmail.com with ESMTPSA id
 n12-20020a17090ac68c00b002009c05b802sm7459286pjt.2.2022.09.13.09.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 09:19:15 -0700 (PDT)
Date: Tue, 13 Sep 2022 21:49:10 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: pbonzini@redhat.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/kvm: Use num_vcpus when testing ICR in the
 xapic_state_test
Message-ID: <YyCtfu8zvvTKKs1u@biggie>
References: <20220903073901.73862-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220903073901.73862-1-gautammenghani201@gmail.com>
Cc: kvm@vger.kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, guang.zeng@intel.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Sep 03, 2022 at 01:09:01PM +0530, Gautam Menghani wrote:
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
>  	kvm_vm_free(vm);
>  
>  	/*
> @@ -153,6 +156,6 @@ int main(int argc, char *argv[])
>  	vcpu_clear_cpuid_feature(x.vcpu, X86_FEATURE_X2APIC);
>  
>  	virt_pg_map(vm, APIC_DEFAULT_GPA, APIC_DEFAULT_GPA);
> -	test_icr(&x);
> +	test_icr(&x, nr_vcpus_created);
>  	kvm_vm_free(vm);
>  }
> -- 
> 2.34.1
> 

Hi,

Please review the above patch and let me know if any change is required.

Thanks,
Gautam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
