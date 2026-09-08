Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDAF57F737
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Sep 2026 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883502; cv=none; b=TBy6rAccg7gM/sInQusbjL5R4bqB7PiFdI4suoiJYh9/wCCsssakqvkV9YasLHymr6QOA7eZJYjW8nfNy1FhqddZYMSSARlI2hWsuc+xLi/J2WKdZVKsfWfRRGyEMyxg8+nuYGQ4IcFUGYC6+GQmTvBeECEjXug5j0rEuVznESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883502; c=relaxed/simple;
	bh=PoIZefIYgemK9yZJ4YbXFzvrGW+3EnfGu14JP84JhVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDGkN4uTvvJfoTUSOHNq2lLkmDwif2AIiA2ucM+YKCrm02q4Wm8kseEBFZ4aOxcOwVDcssA7nBVA0cT//NkVZbYwct9sfIeHvhWMpbulAAqQEXXqnBrorzvnDojr5L3G3UUb/AnhDehEorBPScf1UH8ZXooR9cTseSzkukp6CWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khRoo4J8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khRoo4J8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382ef647e20so5026892a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Sep 2026 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883498; x=1789488298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udEwa8n9rLXAHa2zU6AruMqakZJAsEvaZhfj1mlF4oU=;
        b=khRoo4J81jgJxfe2E89ArW97OxZUqoJKDoWicJfFlV8l5rxg5viPorIlSZeAz/4QFu
         NOQmj+imzGmOYDSi4eNaUHXK3E+aOnyZj5szfcrHhjeBeLTLP/gzQGayWWXdfl5N0g3K
         MVhuAkB3nBtMr2vvOj5Ba1NguePBeUWdUyI53mT7dZ+W4SslHN6wrUlWTUWdGQy5lh8l
         l0DVL535jmrgZ+0eT1HxkVl22RL44bxJ9vEoccR5vtixgELL+ILIGMA8aL9pEBNe4pYI
         S3bGfgx485lgeXf6zobSRrvioCZWU7acUZ/bryMPGDhAIogeDajvxl3Iuc3ozwcNAe4K
         SKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883498; x=1789488298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=udEwa8n9rLXAHa2zU6AruMqakZJAsEvaZhfj1mlF4oU=;
        b=Rx4OuRaNwkQTS/zGWUbq7BaBIZUgisB2WfFSuZgzf7vDCNMIb04evvdP4poufvOtnO
         fKGon7AFc3KwoUYk4nQhhgqFBp6dsh4nEZW217uEJe3zZujAoaCFaSNc946Mwk/zruko
         0UjCX67ev54rrXC6R/rHExjqsIwRvYFxeAAJHp9fPIEIX4vw7gPXU0oNfmOoY2h3qIpb
         W+AVnEHDTQ31tj7Xq1GqFNGJ2IDsbW1+iJGKdzDetKnyQ/NqiXpslGtXcqKUk6tw5rBB
         4HY2bJX2jL2egiM9XPxB1uCYTq/jOyx9xCgoyN6SWHlNgc6wnRybvsf6mU3mwiBsir6l
         ZQcw==
X-Forwarded-Encrypted: i=1; AKwUvBy19JvJq1IWXun3eO8CDKWiS30MKCvSoNvofXVCBRNX1TAi7KDyihBlUWbpQsrr3x4ZGg9wjAyX8TxoS8JNoQFL4sTprg==@lists.linux.dev
X-Gm-Message-State: AFuF++k9pGXHcJNVb3+t5z40P+2oWNuc0abO+tuVsp/9QJg6gWUEZ/BY
	Y08HJK2DEyY8aJUkkpdvNnstyVB6wLNLX62PPJgvekNZ+nCbWEz/Cdox
X-Gm-Gg: AYBFou3QaquuBb44voXYaYQcpwM5+jz7Ah3+DL7Hdw0dzMXPt5Gu6L3Bwol4SlutyBw
	kPGp6vjastwDly+nDdABt6ew/E8owUEmhvY/8bqCsniGCmjNirP0VVhPC+meOWL1QjPuv6ekTNU
	3clO4yb6sZGqlsAp9eTC0O2gjrmlAMZidIH2kQj+Mxl1fNAM8xmhs4ZvahiJNtAeTVCXM/iGeTk
	Z3rR9QpgynvPGE4Q7kH8wp/GP68GaAlG5/yZHWL1XpwZYSzzp8W249GNu5VNRevM2IWN0omJlB6
	RI5IeOqNsz3kR8VL9pdW6SipNZp/NxW+tdvnHTG+nA2r3U4OdVG8fmEzI028Mzhokq7bZqKQEb9
	oTx2RAQRkioJdBexIVVmfYwvQb4cl72GEvSzCILi9GWp1vQq461iIPgyxNWSKNvBrTyW2CckdU8
	1HaviBzpskOG42ynycDJdhJqyvh4SJ3H1GImZ9HfIZ+FiJjAmCMElXoDFyTzx3O/NfZRl7T89Y9
	8zLA5tvr8eo
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr41870407a91.6.1788883497638;
        Tue, 08 Sep 2026 09:04:57 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:3ef4:ec38:7826:6c9b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm14204525eec.3.2026.09.08.09.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:04:57 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	shuah@kernel.org
Cc: hpa@zytor.com,
	binbin.wu@linux.intel.com,
	kai.huang@intel.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v1 1/2] KVM: x86: Reject reserved CR8 bits in KVM_SET_SREGS
Date: Tue,  8 Sep 2026 23:04:25 +0700
Message-ID: <20260908160426.6547-2-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908160426.6547-1-tharitt97@gmail.com>
References: <20260908160426.6547-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_is_valid_sregs() validates the incoming CR0, CR4, and efer values but
never checks CR8.

When userspace passes a CR8 value with any of the
reserved bits [63:4] set, __set_sregs_common() forwards it to
kvm_set_cr8(), which rejects the reserved bits and returns early. That
return value is not checked, so the ioctl reports success while the
requested value is silently dropped. A subsequent KVM_GET_SREGS then
returns a CR8 different from the one userspace believed it had written.

Factor the reserved-bit check out into kvm_is_valid_cr8() and use it both
in kvm_set_cr8() and in kvm_is_valid_sregs().

Fixes: 2f5bb3fe5835 ("KVM: x86: Move the bulk of register specific code from x86.c to regs.c")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 arch/x86/kvm/regs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 8f66438989e4..fad31b59c622 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -440,9 +440,14 @@ int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_cr4);
 
+static bool kvm_is_valid_cr8(unsigned long cr8)
+{
+	return !(cr8 & CR8_RESERVED_BITS);
+}
+
 int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8)
 {
-	if (cr8 & CR8_RESERVED_BITS)
+	if (!kvm_is_valid_cr8(cr8))
 		return 1;
 	if (lapic_in_kernel(vcpu))
 		kvm_lapic_set_tpr(vcpu, cr8);
@@ -565,6 +570,7 @@ static bool kvm_is_valid_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
 
 	return kvm_is_valid_cr4(vcpu, sregs->cr4) &&
 	       kvm_is_valid_cr0(vcpu, sregs->cr0) &&
+	       kvm_is_valid_cr8(sregs->cr8) &&
 	       kvm_valid_efer(vcpu, sregs->efer);
 }
 
-- 
2.53.0

