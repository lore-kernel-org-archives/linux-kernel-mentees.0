Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D257EDB2
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Sep 2026 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883491; cv=none; b=FKESbL8UAqtPbDpNZNrgvRy5xsb4XtRZ/hTsNouXxArnRQH7byB8eMBgFG5ACsXwlzmDBk3Urzdqf8YgjvB3cd6ld/i7VwPryxJObZY1t2XIa1gWOY6CMXcpuPpPFNj0D9YBS3A7qs6b3s6W0ctguQg0cM7NiKmOg9WGU24PBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883491; c=relaxed/simple;
	bh=7yF6qk24zs7GwL8mnF2yvNXOoswzv1qxjksGdcX06Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEi2Xp1mJqbWYqKU1bf75VfOjGHngXxp4ZypRtz3HAlPeui1lbp94VfHyuwPODT+HhhEDkZJHc7TB3xX8PXauODy3u/4pnSgcKAPqRH4OsEaeAdFSJEO0DMUjkhOAuvfT8gImblLDvJkcyxqaY5+nnb5PUqmENtyJ4q5QeBF1D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtnfHpxk; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtnfHpxk"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6aca0f482e5so5461589eaf.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Sep 2026 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883488; x=1789488288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=51011n7DKhl5RNF5xzZ7n3Z9WFktYO/WAIKo41x7Fmw=;
        b=KtnfHpxk0uucwcRkOf9mXhNcIYUmpl6XNQNzXKo0l1cdOUHJoTGRkndopCZ6lfJge8
         bBN0P5uoWPyhJUQu9ekPt3okULM9e+Y1r6cjc0bpQLU5MtU7JX1BRHNvdiottbWOyuMH
         eWU5mzja6Qq2EenL5DmRivAe7rd3hllFl3b8TJijcOHVldZKO/6gLSByU/JOvinDVt8f
         nASUptInCKpkb5sfjRwSge3H0MQEX7vaIbXhxR98v6ldadmaQ8qctckYRRAZMvLIbHD5
         LbpilEW3XpNCS7ltTBfiQiOAbiyeR2DRNVxqV2wjGFbFHQxPaYCbfl4U4hzdBrydbzmr
         9DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883488; x=1789488288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51011n7DKhl5RNF5xzZ7n3Z9WFktYO/WAIKo41x7Fmw=;
        b=pI+O4c2vAS4TOPGZrmMmVXvH6yYflPBmlYL9QamfHJ2oE/IRoSrpU+1EFZFt4G2+Kr
         aY2Y/1xsnpqX5fQILSsSgycrHXgN42EjE4Aj3vjOi0uDZ7CTUBfHnXsy149WTSdYf9zi
         GedYWPAnESGQsYFelR65Myn5sm5+rm7LRyeSLnoZQ010NaM0kzw7BLKyIx+67/rbasLd
         l6lCPH6Uc8f+zUHxZudnd1ZYdzvyQy4FCjVa9W1uryJokEesZnas8QNXVA35giffVsUI
         C1pWPbi/MgCNFqgq85qaSDTmE77F6Iebo8fSk2PRZwZC2xEhWBegVrvF9qDh8DnycKs8
         DhbA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5GLVe7b5o/QZC0/fEgOLnkqd2b97SkWbitDRV6NQx32YNZ55/de2q9jBLJo56XXPO4r1A4Q6y12XCUCNll4Hn73ZQw==@lists.linux.dev
X-Gm-Message-State: AFuF++lVEJfijc6rz6FMEu5iSLbRjYFAyOeArrstY92hyrKmotItskyp
	L4ldON/CO5twJ3gIIban6XXK/vRWLXDEu/U6rNLe6cVM4m+qm9dD/obQ
X-Gm-Gg: AYBFou3w4N00bwTf9MOSSHJFisRgF38hyWvTTHjzSV95Lx/tTOycC3yeGlVm7BSvt0d
	pOHHe1e8/eU2ZMbN0VT8EPXofLA/YOhSI8qsdoJMl9RzmIF5LcDTiduB4gDxDzrXeisZHfF0ip9
	mx9mCIQjGDgFsZebM1iBmM91czfoVRUiqXUGyzG1iMjBWhngaqQcp2QAxShI9/N3uPTCaTaYytI
	acxAAavfc6Kx5d9uFKOYSpyur9QQ19n3HfT0qDtrbhjP9DDhdXxJ/y5ztY7luQhYkapgj2ROm/B
	o56ocqNHGIyl1mvhGWmkbALW0gIqbFJk4AOun+LZn3ybmMenPdFjAsJDZZe1J26fCSEfamlwEbn
	4IiUtZ7CetiJvh5xv65xZ5XClV3o4bb27XU8Pi8uNA/YA+epsZLbNz8wmZaGl8PxjuNjDY4M66D
	Sqr0bq43/tP+xVQMTprht2ZgLjJgckl8pGsyoP86n35k/ZMEGnU/CAA/zrzn7iyAR74XvvdnSBC
	n5SysU5UecB
X-Received: by 2002:a05:6820:2219:b0:6b7:8415:d77c with SMTP id 006d021491bc7-6b78415d829mr15051491eaf.39.1788883487843;
        Tue, 08 Sep 2026 09:04:47 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:3ef4:ec38:7826:6c9b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm14204525eec.3.2026.09.08.09.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:04:47 -0700 (PDT)
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
Subject: [PATCH v1 0/2] KVM: x86: cr8 reserved bit check
Date: Tue,  8 Sep 2026 23:04:24 +0700
Message-ID: <20260908160426.6547-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_is_valid_sregs() validates the incoming CR0, CR4, and efer values on
KVM_SET_SREGS but never checks CR8. When userspace passes a CR8 value with
any reserved bit [63:4] set, __set_sregs_common() forwards it to
kvm_set_cr8(), which rejects the reserved bits and returns early. That
return value is not checked, so the ioctl reports success while the
requested value is silently dropped, and a subsequent KVM_GET_SREGS then
returns a CR8 different from the one userspace believed it had written.

This was found by code inspection of kvm_is_valid_sregs() and confirmed
with the selftest added in patch 2.

Patch 1 factors the reserved-bit check into kvm_is_valid_cr8() and uses it
in both kvm_set_cr8() and kvm_is_valid_sregs() so that KVM_SET_SREGS
rejects reserved CR8 bits up front.

Patch 2 extends set_sregs_test to cover CR8: it verifies that bits [3:0]
can be set and read back, and that every reserved bit [63:4] is rejected
by KVM_SET_SREGS.

Testing
=======
Tested on an Intel host:
                              Unpatched kernel    Patched kernel
set_sregs_test CR8 case       FAIL                PASS
KVM x86 selftests             baseline            no regressions
kvm-unit-tests                baseline            no regressions

Tharit Tangkijwanichakul (2):
  KVM: x86: Reject reserved CR8 bits in KVM_SET_SREGS
  KVM: selftests: Add CR8 reserved-bit checks to set_sregs_test

 arch/x86/kvm/regs.c                              |  8 +++++++-
 tools/testing/selftests/kvm/x86/set_sregs_test.c | 12 ++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.53.0

