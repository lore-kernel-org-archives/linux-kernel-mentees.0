Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDECA4EF151
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613609; cv=none; b=Qb3mRkg1gQNxUWd0O4CnxPIZ/ZejKoy8RBZVvSz7SeNtC9JvpeVUlKRJXOqBS8M/7Wc2pNWMWoD5TxT9q3OOuLWONJNklnW+ARyxog1mBXynyi0QjrosjiM37i4rShXRmVW/BZppBH6qFM9WOUtdAADPgfjjVuAGovmc2LE8Udo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613609; c=relaxed/simple;
	bh=6THoCCBVd+/ZjxZ3xgtcJIVoQhC/QcPIewn4tAZ+WI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BMjB150+6tb1ZNu7cqEF6h6dqFVHni/3BzzY55ICg9J0sdE+FS5sZxZokb47Q11jup71sriVnIDogFSbWWQHsQGtbvc5c20v/GopFr0jAdmkG+zPWQwlDLnrVqu5UK0DouGFs59TBlhhsZ5OCQ/NbLO5VZUrt1ivh6hIAIfz0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AaMvCIwi; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AaMvCIwi"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so3977531a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613607; x=1791218407; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MWRr8LBMaJZmxpSUxy/Rjeh3NVu2xmhfdirmx3vVU0=;
        b=AaMvCIwi/R5Kl9Zix7bFIMi4YzHJRr39yW+pcXTcNam1y6PmhgKPoYa2mMtHbLXLEa
         Phl0j7Mzy4LW5cyTNGsV1j1ZbKBvtcevMA4CtwmWDCb2pw8mprbYrBqsjG2IA3aXVb8x
         00XFuVYmb1WPvR7W7XIHmwAXDFhJYMBAPvXkTXh4xZaENgq4Yd9S62oqOSJyqT4T4gCO
         h5AQ+/1NN+a3IuF5u3anD9VJmesjrE9HxnsoWfxUC/AoTaGcBx7rQ07aiXoL4EvweRaQ
         mB5roym5Q3mK+zaEOiJumAuhjI4fNSto1MBwRxSMnjx7vawDXCI359OBGS6nZhIlZ9Kj
         Dx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613607; x=1791218407;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MWRr8LBMaJZmxpSUxy/Rjeh3NVu2xmhfdirmx3vVU0=;
        b=1QtLnjLEqVD+W/YpQZd4iVCdYn4dXfZfSpZaPR1zqSQelaJSh7ME1pJlJaSDTjgGmb
         RQvVFyfu1vGm1Ltz9R3PHVxe2PMsv0a7m+48/AWMWFcmPJuPu9LKNGu7BGQv4ERlvXSY
         3fxkHrkV5kRtl8mwPKxQ2PN+6FMq3i3i2dn7/9XAyDUAquEOz4vhuKPnGZ9RndSSG6oy
         kXcePaQ5Gb66k/F88sIvgEhWmy4f04SU2Do10BFTOeLmqiDCPVQINrlWEUIxEZcnpplb
         bq/84XgX3lNgworefSt3TGESd1HyVRc+/JY/ebkTLED7kSHwRkIrNsFbiMLkomxQzIZR
         BEvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/GFYO+7M41MktDGZ8ZfxBz0Ug9vhnweviYGbI6tzHSLckN2b27frCr1kECRsG6qB/92fTnwpaM92QtDYzUK7m7OwZAw==@lists.linux.dev
X-Gm-Message-State: AFuF++l82WJOsCYUhBq3HQ0C9iO8WHYbgx1UEPS/mrfbTqspPukSekiR
	XZt7cKGs0KyVN2yu0Ys5knKy/xhuRIjcm+Vfv9dxeDHhtTG71D8o94BSlxGAHlOhlQYGq1TaYxC
	AP4iNTw==
X-Received: from pgbgj7.prod.google.com ([2002:a05:6a02:4947:b0:cc7:9d5b:c2ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cf8f:b0:3de:79b7:d62e
 with SMTP id adf61e73a8af0-3de79b7da7cmr609965637.54.1790613606937; Mon, 28
 Sep 2026 09:40:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:40:06 -0700
In-Reply-To: <20260926104355.13697-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260926104355.13697-1-tharitt97@gmail.com>
Message-ID: <arqYZpzSNppxYBK9@google.com>
Subject: Re: [PATCH] KVM: selftests: Verify KVM_MSR_EXIT_REASON_INVAL on
 reserved EFER write
From: Sean Christopherson <seanjc@google.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, me@brighamcampbell.com, 
	jkoolstra@xs4all.nl
Content-Type: text/plain; charset="us-ascii"

On Sat, Sep 26, 2026, Tharit Tangkijwanichakul wrote:
> The msr_filter_deny test covers the FILTER and UNKNOWN MSR exit
> reasons, but nothing exercises KVM_MSR_EXIT_REASON_INVAL.
> 
> Have the guest set a reserved bit (bit 63) in EFER while preserving
> the other bits, and verify that the write exits to userspace with
> KVM_MSR_EXIT_REASON_INVAL along with the attempted value.
> 
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> Tested on Intel Core i5-10210U (VMX). Not tested on AMD.
> ---
>  .../selftests/kvm/x86/userspace_msr_exit_test.c      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
> index 2808ce727e5f..7446e1404264 100644
> --- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
> +++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
> @@ -309,6 +309,9 @@ static void guest_msr_calls(bool trapped)
>  	/* Invalid MSR, should always be handled by user space exit */
>  	GUEST_ASSERT(rdmsr(0xdeadbeef) == 0xdeadbeef);
>  	wrmsr(0xdeadbeef, 0x1234);
> +
> +	/* Setting a reserved EFER bit is rejected by KVM, exit with INVAL */
> +	wrmsr(MSR_EFER, rdmsr(MSR_EFER) | BIT_ULL(63));

I'd rather use an MSR that is less likely to gain supported bits in the future.
It's definitely unlikely EFER[63] will be used in the near future, but it's far
from impossible.

My vote would be to write a non-canonical (even with LA57=1) value to MSR_FS_BASE
and/or MSR_GS_BASE.  While it's technically possible that x86 could extend the
canonical address space, that's pretty much guaranteed to require truly massive
architectural changes.  And if we reuse the NONCANONICAL macro (which we should),
then even if the unlikely happens, at the very least it will be easy to find what
all needs to be updated.  As a bonus, the test already uses in MSR_FS_BASE and
MSR_GS_BASE, so they're naturally fits.

Alternatively, we could use PAT, as it's extremely unlikely x86 is going to gain
new memory types in the near future, but I like using a non-canonical value.

>  }
>  
>  static void guest_code_filter_deny(void)
> @@ -627,6 +630,13 @@ static void handle_wrmsr(struct kvm_run *run)
>  		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_UNKNOWN,
>  			    "deadbeef trap w/o inval fault");
>  	}
> +
> +	if (run->msr.index == MSR_EFER) {
> +		TEST_ASSERT(run->msr.data & BIT_ULL(63),
> +			    "MSR_EFER data missing reserved bit");
> +		TEST_ASSERT(run->msr.reason == KVM_MSR_EXIT_REASON_INVAL,
> +			    "MSR_EFER trap w/o inval fault");
> +	}
>  }
>  
>  KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
> @@ -667,7 +677,7 @@ KVM_ONE_VCPU_TEST(user_msr, msr_filter_deny, guest_code_filter_deny)
>  
>  done:
>  	TEST_ASSERT(msr_reads == 4, "Handled 4 rdmsr in user space");
> -	TEST_ASSERT(msr_writes == 3, "Handled 3 wrmsr in user space");
> +	TEST_ASSERT(msr_writes == 5, "Handled 5 wrmsr in user space");
>  }
>  
>  KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
> -- 
> 2.53.0
> 
> 
