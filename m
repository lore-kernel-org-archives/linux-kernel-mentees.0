Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74982862
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719615366; cv=none; b=JRgH5iK7s0Q2m5wjNnUzZbeXc6oQ7/p2JUROT5/FaIqUdcSbr0+ateITjzL7pNBU3IkOwWQVeAnpJZhReNKei9ZTMPmpOWjJ6XKtSIY0bcHo8hZOftwne7at9Iow+isVdL1/HmZ/1v07kFwPxl4j/h+pwQNz4znI8o4A4/XSLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719615366; c=relaxed/simple;
	bh=LVM3uqkTSyhKCZpetJYUvE3Yr/mF1UV3sFe8vrzMhE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gSKvmbA7JVsq/6KDrlfoEaXPovKfsKKFmp031+KD/mswJsWA3D3mVzfQnNFv0bqDTSQcQnaarmd7HXEotTLmUE/FD/CZEm2gxAhX69qgUIo3c4jc669hygU3xL33IilSozXuRBYtem3C9nJPRNWA1VR4YAJo3Sx4vjc0uTKeJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2OEYx3y; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2OEYx3y"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94AE441D84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGOyZG8z5gCN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 22:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3gt9_zgykadgmyuhdwaiiafy.wig@flex--seanjc.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F041F41E0B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F041F41E0B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=e2OEYx3y
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F041F41E0B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:56:02 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-72492056db7so731509a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 28 Jun 2024 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719615362; x=1720220162; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttnlucE2BUFc3AsSQbZS8PZZ80YXekALgZ+NzdoS5mQ=;
        b=e2OEYx3yUSH9KvhCnhSkX0gabG07PKhbjsS+JtEo3jZk+Ky5Rzx7937zY1TT4H26N+
         d/bHSxNt5bCxC0jBG5WyLdkR1ogUeYgi9fF38xhT/CNzqnxJqgHGNZEaD2m8lWTttMXm
         fkaOOJemrWnt2eDIKsyCqm4snUxlZRzOyX+FAlPnMqT55WAdAFgwceDlYfR030ZXQ5Jq
         z6o9JaPwTGFN8uIto4rxAKbcJ7B+tS3LKLQXjG4hjIdnbreMoNNa7AvRigS9LRdXgFkw
         xNvgxnbYKk9S/hgaDY2OlRw+e/UlnkS7MP2WNo1fX9IqddfdErgzBD7LgDSrNpZ0Z8jf
         dszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719615362; x=1720220162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttnlucE2BUFc3AsSQbZS8PZZ80YXekALgZ+NzdoS5mQ=;
        b=ZHtSMklhSPV5hQIaU7kb12HDvcQota6c6hfsE20B6GzCnZc81+dTQ/ppjQkOY/W0mu
         w3kkgYCRqTOX6Fi7m04qx3xegSj38hiW/FkNGazDFvv6MlOfvaKeQtuC6ergL0jHbQeC
         mc5cmAv9NMj4jpnKPnSlMLHbe4Roq6aUnD+covdQaJT8nl4y325VHPsqdvRyI/gbfu9w
         nl58ZxKJF2dJaevk1Wd/Fc9zI8jCtyfwQC/Pu+bVQ3/1xAf7NiAPViQRbFW+oiLeuP+J
         TjaWzUl/+6gLoQ8IE9fq4KhVxtPDggyAKYZIYvTcx9c6GdR1oPaCVJj9Wr/I2SquiLpM
         Namw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Gu8BR+aYXrJf1ZPmiGDPc8uKvoPSyjvjim4pUpghkzm8Zv3TaSvG7UNCfuYB2k3TXDFqK3Iur/YxtzjOG/pv7zkoQhivutnWiXP3Oes0104jHzRUEydKdrqMONrN
X-Gm-Message-State: AOJu0YwaSKAUdK9v02friImyRBU9k4zjqZDvvplqtXfOIBdmlhpK8lbj
	XLuTsxRrRytwOtgQdoxzjb4OjvrMgn1NFHu3cU5bWoNDzVAiR+b4J9kdVrmd4eIGlnmH1cd0C3A
	/RA==
X-Google-Smtp-Source: AGHT+IGhT9nWsTP7CsdKQU4fzRBs3sRnyPYbvYxeAui3yoao7EDlWEgc/ibfFsDaevUVjLGQihFbGVHjUFE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3d04:0:b0:6e5:62bf:f905 with SMTP id
 41be03b00d2f7-71ace6d26f4mr47242a12.10.1719615361864; Fri, 28 Jun 2024
 15:56:01 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:55:22 -0700
In-Reply-To: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240627-bug5-v2-1-2c63f7ee6739@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <171961374413.228500.7729150745631933428.b4-ty@google.com>
Subject: Re: [PATCH v2] kvm: Fix warning in__kvm_gpc_refresh
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Pei Li <peili.dev@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com, llvm@lists.linux.dev, 
	syzbot+fd555292a1da3180fc82@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"

On Thu, 27 Jun 2024 08:03:56 -0700, Pei Li wrote:
> Check for invalid hva address stored in data and return -EINVAL before
> calling into __kvm_gpc_activate().

Applied to kvm-x86 fixes, thanks!

[1/1] kvm: Fix warning in__kvm_gpc_refresh
      https://github.com/kvm-x86/linux/commit/ebbdf37ce9ab

--
https://github.com/kvm-x86/linux/tree/next
