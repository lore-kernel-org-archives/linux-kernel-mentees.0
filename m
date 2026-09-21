Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DA64A2A74
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Sep 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999594; cv=none; b=OWU4dI+XSHTcOTVj9Zrt3LDGLGGPICaNIwDPefoMUBp9UZJRPEzz0s5ff/DMTjf09QLnvOc4y2gsbr/CtIT1LBawFMd7RyWfLwargF9BH0DXCYhjYDGEcj8TtCzSUd4E4y6y6sFFSsPe4XBT6HXXrLbaW3VcrYY0Pt/ucRP5dW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999594; c=relaxed/simple;
	bh=OzuuWVIqtaFd/YYFW4xK7+t91VemYX3wot5lc8ID+mk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A8Ull3AB1WEFSLjEbxHqOpNX0frK498Zk1QF8JvoJkysEfm9gV/6j4rHEoWgS1Mo22Ab/fjooux4oUEwRTro1RDc3DayHx2fF0IdL8rChNtOzdiFJO60Cnj9vZaXDA10kOXFrATpmtZlJKGpDyt2YU8bWCLCF19qrVB4KzQ0290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=toChFK9a; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="toChFK9a"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2749201a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Sep 2026 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999592; x=1790604392; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZN6pn1oKVfiJrGbRYveJPh3MZHL0XDj4nwpj69nUOA=;
        b=toChFK9ap3fsFOr97Fd5Mn/q4mRdNjoGjUffh9Th9uWh+UrO02QRrcJYGokrI+9VEf
         cPUKdY+WZ0pPZ3T/IYu2D9QZs3cJaj75TBbkZUskV8+SF2iX7A255H8Lj0F+PorCfa+Q
         XQjhozERNg+/EA5QzhvHR/r5ee2zY1GE+8kn3sEBAkAbM+V2kRbXNnPuMYu0+HKc2Udh
         30yJN1WWQtnCGOy0FTt6U7qAi80EZBfrNO4s7yvbCvZrwhqK15hoZvkto5p1FTHm2eSJ
         L9btPgmJnV0PMnC4K5DBkRjUilT508mpVY0X3xQQfnu/P6sU8SxvPRY5V6sni2B1lqfI
         0jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999592; x=1790604392;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZN6pn1oKVfiJrGbRYveJPh3MZHL0XDj4nwpj69nUOA=;
        b=ixJN5DvGGDMHXkWCr1iiWW1gpwpBDnQNSw/cQk3hZlZRRlIERGam+/Xw1+u+DHx7iK
         T2CSQKzaB3VErfBeQj5gBWlKvhb61oRnmgPYl+xeMdIH8liiqryvMoinxs27YUUPNC1L
         3WLbBHnoGfBItQQRfxcUj6or3LiEerqhu03GF1kPiYaNQW2HNpI8qP5anXQ+RxccjeW1
         v7RFva0/vmxT5DZOkOJszNYlUq8aGrDMYzpw+5L0iVlbhZByPUY71brYVXfyvwQPBNSw
         RnbSkr5IHMpqMJQ5McdY3bK8kWV3ZdQPxvHscgd/lzf/oysvLXS8rYN/sYMuNY+prJN4
         tR5w==
X-Forwarded-Encrypted: i=1; AKwUvBwfO0qXyL6TUMsRorjhlKtfBA29Vvz8AofRramieTo9GLt8TTjWL+3Mfdw/s8f0yAXbEu69MIl5oMzQ688y3/rxeqaCKA==@lists.linux.dev
X-Gm-Message-State: AFuF++nb79XNBrYDCqJcDzijbTdIgsMHpCJjRU3EsJbGwq/k5eNq0KFZ
	pnGZ9Qg8eqNXWuIwc+BlQ1Stmv7FtyvYlUdW8ubnjjJWKAM+FVw0T6hXOxsvXfVuH60GlBMjhVm
	3rLgOng==
X-Received: from pfbdl11.prod.google.com ([2002:a05:6a00:490b:b0:879:66b7:29a9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2443:b0:3d3:ae1f:d7f5
 with SMTP id adf61e73a8af0-3dd8c4ff268mr16788092637.21.1789999592068; Mon, 21
 Sep 2026 07:06:32 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:16 -0700
In-Reply-To: <20260908160426.6547-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260908160426.6547-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999676410.711234.12909851740804144889.b4-ty@google.com>
Subject: Re: [PATCH v1 0/2] KVM: x86: cr8 reserved bit check
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	shuah@kernel.org, Tharit Tangkijwanichakul <tharitt97@gmail.com>
Cc: hpa@zytor.com, binbin.wu@linux.intel.com, kai.huang@intel.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="utf-8"

On Tue, 08 Sep 2026 23:04:24 +0700, Tharit Tangkijwanichakul wrote:
> kvm_is_valid_sregs() validates the incoming CR0, CR4, and efer values on
> KVM_SET_SREGS but never checks CR8. When userspace passes a CR8 value with
> any reserved bit [63:4] set, __set_sregs_common() forwards it to
> kvm_set_cr8(), which rejects the reserved bits and returns early. That
> return value is not checked, so the ioctl reports success while the
> requested value is silently dropped, and a subsequent KVM_GET_SREGS then
> returns a CR8 different from the one userspace believed it had written.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] KVM: x86: Reject reserved CR8 bits in KVM_SET_SREGS
      https://github.com/kvm-x86/linux/commit/3e7a842fe533
[2/2] KVM: selftests: Add CR8 reserved-bit checks to set_sregs_test
      https://github.com/kvm-x86/linux/commit/2b0e0aa54fa2

--
https://github.com/kvm-x86/linux/tree/next
