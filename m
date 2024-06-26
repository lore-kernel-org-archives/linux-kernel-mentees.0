Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D353E23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 03:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719372197; cv=none; b=K9aw5txyo7rgAWhrOROfnW6kAov9tKCk0QNjLrpAKc+6DEIityNguLhQhoLmEPPVEujdOSM+2XBvsJSYMEBu+FV09nQ72EdwhK4x3xpFUNU5kJ6rnaRXHnpSc4OsIS2bUbGlL1TSF9tnFdgWln057VJNM6pOZcVFoC4ILA+oAYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719372197; c=relaxed/simple;
	bh=aWjn1rK90uH7zvPoIIMTcC/De3KqAp6uqTomLwmzbzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HE2zG8bczc/JMjRydQoRsGzCXaN5yq77BGoy7IrK3UtUd2rTmOtDCi1zLIy5hcS14kKX8LVwLvrcwoLTC37qVRwY7+S90/i52flkHVxaMVZ+D2z+5Y08hVxEuGaPqrPA8JePhDBmCfP87wshqnKbux0tEI8HCRrCIDVs1Lej0u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1COvolM; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1COvolM"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F2B14045F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 03:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zjFyUP8dO1k for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jun 2024 03:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=peili.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22A764011B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A764011B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E1COvolM
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 22A764011B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Jun 2024 03:23:13 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso6204438276.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 20:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719372193; x=1719976993; darn=lists.linuxfoundation.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iv3u99b064y1TsWE2viRxdT9uyZ/YeMIpIqbTIyfWg0=;
        b=E1COvolMeSvtslALjZhmltdZ/tNQ2sNFOeUWxk4N1HI48TenSgdPbD6WuXMeKpBNEy
         PRNH16dYzwBT/WClXNWPoA8rjN6kyyNGKY6gz5i4w1rz9b12iR1fHtEFp6yQAGA9+KJt
         /AgIJGir1aP03DJbe3AtYt+neB1QnQORmsVFb6EmqFgj3RfZFrNHtSlUGsX2n8QWp03q
         x9EptPrSl/g3hQzoFs0hi/+Q/9x0/EbgDw4lF+hvXLbKCzTdtD5duob4pa7UFA11npTy
         ijzP4KAzBdXNPXLh/LE4kDNnCfs+mDKad3+YCBhWWiw+jUf+uU6+dd27AUvyvWYDkRr/
         YE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719372193; x=1719976993;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iv3u99b064y1TsWE2viRxdT9uyZ/YeMIpIqbTIyfWg0=;
        b=wGI7adTMwd3LVbtrf/FBXxc9e+wqJ4aajyF9d6121FsYGBjj8dDHd/JoJiCSk7uRUF
         Lsv/CQiddpOihWdHhY9DvMrx3NH45CNfjRa5ti3DIOJ27YpBROmLEuNmzsRFh7THEA7i
         0SncCzLYG1eDJUYthkoUnwoOBOThNH8wBFXJy4NzAjBdose0nqDRMQ1+5YUb0WX2V/RD
         l5Og/j/cJ2X6r6eO4xLF4vyvwsRmiO2ShCZv4HF/BbUHWc2EJ5IGQO/qI4Hk8kPSHxfY
         +14CV9/v4VZRNOgp3qBgqp0GEigoeplPYU3bzRinfYZkahoqv6xbMZFCCNV3040J+95C
         kE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgqwhtEDQZcfpoFof2IizrrC+dtldGeatwUyo0Wqwi1PiNtXzP65HB4qGr04biDEkemqohPmH8Zoqppjq5sxKtwF9yYUpkEzhKzVvGY+kbaXaOca8FBxlvaM7mqiyF
X-Gm-Message-State: AOJu0YymcIRPl8bG/cPFLVP8t/i6+H5+3JKXe77HhdDqAT0JbzZLTGOz
	wlgbjFQrkvaYLZzQcIsalbWRi0MPrjnnsDVnyuCk9FaApfPC02PN
X-Google-Smtp-Source: AGHT+IHb3wM9H5WMVTrsE2syyBb82TfzvE2pNvRpcgKYhK4WGjMD50iPrm/hNpnspsj/and9mebuWQ==
X-Received: by 2002:a5b:f90:0:b0:df7:7437:5801 with SMTP id 3f1490d57ef6-e0300ef0111mr9909472276.13.1719372192697;
        Tue, 25 Jun 2024 20:23:12 -0700 (PDT)
Received: from [127.0.1.1] (107-197-105-120.lightspeed.sntcca.sbcglobal.net. [107.197.105.120])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e62655b1sm4165494276.36.2024.06.25.20.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 20:23:12 -0700 (PDT)
From: Pei Li <peili.dev@gmail.com>
Date: Tue, 25 Jun 2024 20:23:10 -0700
Subject: [PATCH] kvm: Fix warning in__kvm_gpc_refresh
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-bug5-v1-1-e072ed5fce85@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ2Je2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyNT3aTSdFNd0xRjY6Mk01RTQzNDJaDSgqLUtMwKsDHRsbW1AFox/cJ
 WAAAA
To: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev, 
 syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com, 
 Pei Li <peili.dev@gmail.com>
X-Mailer: b4 0.15-dev-13183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719372190; l=2384;
 i=peili.dev@gmail.com; s=20240625; h=from:subject:message-id;
 bh=aWjn1rK90uH7zvPoIIMTcC/De3KqAp6uqTomLwmzbzw=;
 b=MhQKsSHjCelN+0W7sTUon0XvADfhupXmPz82SKJtr4qpcJEbC7Ig+R8b4TLKewDK8R6Hdy/qN
 zggzvVEplRSD2cYhuGn0i+u8jsC0aJEzwjSfa9ZDZGdUpktFKblDp8Y
X-Developer-Key: i=peili.dev@gmail.com; a=ed25519;
 pk=I6GWb2uGzELGH5iqJTSK9VwaErhEZ2z2abryRD6a+4Q=

Check for invalid hva address stored in data before calling
kvm_gpc_activate_hva() instead of only compare with 0.

Reported-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
Tested-by: syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Signed-off-by: Pei Li <peili.dev@gmail.com>
---
Syzbot reports a warning message in __kvm_gpc_refresh(). This warning
requires at least one of gpa and uhva to be valid.
WARNING: CPU: 0 PID: 5090 at arch/x86/kvm/../../../virt/kvm/pfncache.c:259 __kvm_gpc_refresh+0xf17/0x1090 arch/x86/kvm/../../../virt/kvm/pfncache.c:259

We are calling it from kvm_gpc_activate_hva(). This function always calls
__kvm_gpc_activate() with INVALID_GPA. Thus, uhva must be valid to
disable this warning.

This patch checks for invalid hva address as well instead of only
comparing hva with 0 before calling kvm_gpc_activate_hva()

syzbot has tested the proposed patch and the reproducer did not trigger
any issue.

Tested on:

commit:         55027e68 Merge tag 'input-for-v6.10-rc5' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16ea803a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e40800950091403a
dashboard link: https://syzkaller.appspot.com/bug?extid=fd555292a1da3180fc82
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16eeb53e980000

Note: testing is done by a robot and is best-effort only.
---
 arch/x86/kvm/xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index f65b35a05d91..de5f34492405 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -881,7 +881,7 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 			r = kvm_gpc_activate(&vcpu->arch.xen.vcpu_info_cache,
 					     data->u.gpa, sizeof(struct vcpu_info));
 		} else {
-			if (data->u.hva == 0) {
+			if (data->u.hva == 0 || kvm_is_error_hva(data->u.hva)) {
 				kvm_gpc_deactivate(&vcpu->arch.xen.vcpu_info_cache);
 				r = 0;
 				break;

---
base-commit: 2bfcfd584ff5ccc8bb7acde19b42570414bf880b
change-id: 20240625-bug5-5d332b5e5161

Best regards,
-- 
Pei Li <peili.dev@gmail.com>

