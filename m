Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C7375F80
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250718; cv=pass; b=Rw8GcpVFg3/lRoPPd9Y94gvVeN4d/U9Mv3mmVTncdanhLInlddUs/2noyVEUJ9rT16AxRg8iR/S4vIP44Jx1jUe6w5BCfVuSW6xDhwWhP8e0qbeVn/118igdYylUZg5/ZU7nGQP6bWisuQ06FDQ6s9frDaGjOk4yPwk1LauAVvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250718; c=relaxed/simple;
	bh=Jm8AzdPrPR6BhXQyJz2nZ42hfc8fkKPUPVq/AoDXHaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4rGHywkStUcv5v/gAGDSjjzAU8DtvOZQc5bCdMJ9FNCqX85zo5dJZYhi9CXa0ZioeDPeW34BEmouSrHyDNhHbQBVIRlL67k02KQc0+Zte9sTly5VGy3K3tlAA+UG1SsOXG7vSAVJlGAKez7HATjvtkw5APnLznX/Qo9vRgOjjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNvTNfQg; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNvTNfQg"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535179e995bso9902651cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 08:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792250716; cv=none;
        d=google.com; s=arc-20260327;
        b=l2kahXBa3+0rT+pIB9Et3sVBpFp0LZWa0arWAtRSeDfTKAenlKHJmKzcGyH2BMbOQf
         Hozu6+yvQRVlsMLnIhYHETNGLvzhnqbVS6lPteqCtOSbYlWspUUdpWNmtLO6rZ+CnikC
         Nz9TzJbK7OPDHjpF/FVIWCgoK3s4yqIxTPkXFgb9h67Gbfhtr6aRdiORrenA/0a1Nb0V
         CtvGv2nA8ccS86VRcIh3Im4rhdBXXI6elFO00yYZZvPKdhoirr0JrHUR3vJiE35ZK5z+
         AIZkBpCb8zCRGu2GlgpfD7dpM6DHE3dGw28N5RDVIGhgxJhysRr1BvZPfL+KhkDt1Xe4
         Scaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        fh=Bf1CXp+IL5OOJa2aOzfoff0o/Lp4CaZXpGnGjsp0KKA=;
        b=JRrCEhhtQUA6oX3ODx7y5a04cDNFTWVFuQLPAaZg3Qj6c9zcdMS8LnfRk5sphv3Fnq
         0y/EQN1RbKYNVzGh/vKGMo56fetP40pSXW8+zjo3bP/S3A5YQob5+AE6DapybcJKZ3LP
         DBzg2lk6N0VV4b1KCwnfQSCfcYCQU+PLBddfSOPWBzfFM8rbRDRkMdVRVxc5TvuGzd/A
         DuQUKGbfovZVM1Rg+rePJQi4xLBAo0Q9+5mU9kdMNcKUaWCk+jAE9tfkKwFSD7v69xe4
         lsINBxIe+MNLC40eUaxazk/tMO067qF6ERyk3Mdu3uImavya+4rIh868bmqflZ0KGX13
         5x7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250716; x=1792855516; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=TNvTNfQgrVqftZU52z50fM+CX2Qr3JNttkGI9hLMW0XqQHXpYDIZ5viZcw6AsLbufE
         V0r97ytQwEGtSK35YnGlYGY3M2aDtLPwT5OCkLYE8nNYj/4lsoHVKK+dufbFa4W6nlE9
         vV7ptqsFz7oFzBrKc5K0GHoFAJ2Wljo5JkoXheZ6kOqPlmFm8sD34kbm0WftnNNeR32J
         SxiPqcEcHDPJYQ0MB2N51cHmUASaR9F32iud5faLjZc/gWjaH9TrwoLlIQR/GtKW0N5e
         js3+0zH4HtI2GZmOOT7eMOztfOoZ+hmrrbVH8e3PC2bkZtXwyOoW01iXXvBU8o8DmM4c
         zIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250716; x=1792855516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=KizG8nH/Kni52l+5YZcc/j9jLDY+Pf9GpakR5QgUPwbuUkcIcsrfRjOR3wJ0P4LacK
         iuA63fYTzlJSnbWteQRAinZ6kLFZ3QCJiVcoXi1IJThLf7ihtRU+Vea0GLvKQAHJ2iD0
         f68a3LHYP+NtkXyjrAPf9QUw27Al1iNp0uypXp+A1vUY58UOJxPXScliqhQuefVNZ0Y/
         hcw8h25kE30Myy51yhLJJlzCJSVmpYgmGxX24LvO3KBio9m2tjAQhn6d7jzcywUI/nma
         RIZgabsTKnQj3XOdAJwDO0YkYW4yapJ0q5lEHnyP3oJF8H30C3TkI2fmiRr6Twawr0EI
         89+A==
X-Forwarded-Encrypted: i=1; AKwUvBy+dLa/1xbqf4hEYGDFLshOuZqfF/6JwyFFQvVh76Q1sGqRTM34pCDhw0mvBl20EdPSqRebXurUrmo57NLgbPkvwlR+Iw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIKZwD+9/Z4aJgS9NTDRYxGtDj06mQfNRcaswvtALe+s1HFK+JF
	mcvR6WS51cZ+zVfVzhDXXf/eG84gtIqGF0k8S09XQNYtFAoGDBvm0wJBIqR0Yi8LoghHgWhJyvo
	GI5o3r2w2Gc4n4frgtpuT+4U5IZ5c0mE=
X-Gm-Gg: AYBFou2OhxZrXJla0PDoC7o8fHpLlnQaZKGKOnlgX6DLbp4cOwHsaX0goZgBhcrgCQr
	suJ7IgABBXfaqb3cGpnLEg9xdURvnEQb2HYpnksNnYdutAbbCXyTbXLUWDj9BaE7u4ht8WU4QWo
	DxAZCm/rx+sgBx+0dv1bKzM+P8UvKPsmlZhgDcKD9ovaJJnzgHSiLumt1D/LNBSsm3wjF6C37lP
	ilx/q61PaZPLFjQK2H0UNigzxEyK2DQaIeBTtGqsMFz5jyysFanmAdMRnYjY7J1zI7pifCJbw42
	IVheptCdZdl8pKG3JD0VioPLkfmQ+CfI/cw3FB3LxfdQwB9zbbuupi6vBJYFSM86SsP/x1hvurD
	0fr2Y3md0vSMyHEaWEpYInCzLgRzNCylq0anYWGCjHmqgbg==
X-Received: by 2002:a05:620a:2783:b0:93e:d051:8f19 with SMTP id
 af79cd13be357-93f29ced575mr485953085a.40.1792250716444; Sat, 17 Oct 2026
 08:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261017110213.46199-1-tharitt97@gmail.com> <20261017110213.46199-6-tharitt97@gmail.com>
In-Reply-To: <20261017110213.46199-6-tharitt97@gmail.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 17 Oct 2026 22:25:04 +0700
X-Gm-Features: AclHuK8Bu8EDo40zZmiyUcWdeJAzBkx4-shpMZtTbASYDmEugT246DxrXg3J2Ik
Message-ID: <CACak8wNa-dbNMGO=4U=JpTqSYWdk9MC+DWZS3WxRwuRRvC1T7g@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> +#define CLOBBERED_SLOT         TEST_MEM_SLOT_BASE
Upon self-review, this should have been hardcoded to 1 (to clobber the
reserved ucal mmio).

> +       ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
> +                                          vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
> +       TEST_ASSERT(ret == -1 && errno == EEXIST,
> +                   "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
> +                   ret, errno);
This should have been errno == EINVAL check to catch writing to the
exiting read-only slot.

The earlier test accidentally passed because it used a different slot
ID (=2, not reserved) and received EEXIST for overlapping the reserved
ucall GPA. It therefore tested GPA overlap rejection, not the intended
rejection of overwriting slot 1.

I will fix it in v2
