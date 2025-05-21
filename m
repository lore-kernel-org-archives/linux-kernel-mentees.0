Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6051E98F8
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868893; cv=none; b=iiP4l8C4KKKfP6boiaKR8+jDdzdAPAXRfYPjYQtm1q595bgAnc2DpbvpurfsgGQyCWa2HVMl8oY81R18Wpkj1vg6vs5GQl7kOEQKMSVF/AXrT/XvCgMovpJS4hoe1KccuKSlNCFULjCxTcuWKLaG3bn4BSxMYnxy/D1gEmZHSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868893; c=relaxed/simple;
	bh=hMM6ZBbu1Z03i6mNXQssFFLvBk0seumlrn1yafMIhGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VhzzUa1ZPIuDIQM4wBFDgqSiiF15DzZBrLzPpxOlqTWaqMQbmcsMWnpAya9q48uGOBK8tatGpw/p4WbsiPC2aCCz6jv0Vjrx5fxX08Ol/xhN02L1EdDT/sg3k5mfzn87ni8JeIVYYFPsjv6taVDv5ZazmjLUjLbzdLxQN2uJHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZRGx5WUa; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZRGx5WUa"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a375938404so2363002f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747868890; x=1748473690; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk7nkRmDcObELLV9MxxzQAakXc5EAbtIqWryuUZfAWw=;
        b=ZRGx5WUafjgqxLdcc5XTpNAIF+uujCfN+upusVx2oVbQsxAdwLgK23vp40PTxVaukN
         /cYJDisaQFgJm/8V5m35tK3+6qARXusErJXh4/KuvCB7Lx0QXNY0HRoNv5+pxZlnJ78R
         gO5bo9zWj2xrgP+DkSG47gwVFXRInheEl2hzlqPrFnzGGVbc3OwGSNdICdaD9YpGZMo6
         kzY/9bVoqzC677uHE8wPsx7WkDdc++7z2vY3/VB1r/qz/1y1M9+FzS8/NneFvnXLgr+N
         8yDKN7oior0rEcFlGAS/1DkINWCEufSvHY9SgpDug/hY1gy7u6N4EzCliXIkq5PLLTKa
         RgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747868890; x=1748473690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk7nkRmDcObELLV9MxxzQAakXc5EAbtIqWryuUZfAWw=;
        b=trHwzTCj/V8v787qEVqO5anubBUzTD8ZPVFN5/TLHF0jUQHQ6Q3sJPLBk8NOwPNDly
         GEbkaSbMVAINvrXKR/hRoEhChICQCaSpfHnJ7m9MgaxhynnXIjMlGdpeXbsyXMriFiES
         9FD4WCzwwNh+fVTnMzRDNxqIZX4v11oeCrIE5u8UjZypOSgE3XNSr57bEusB5tRu9yEH
         ZPydxsBdHbN5aocVN1176mu+sNZc94VeqD6T2Byuh0MUJSQdmOPWe6C2GaCKi3ypYe6/
         qbMJE8yWkxVPItJJw++5SubXMOYRD1qPYMZha221/JQA9PdXczS1ufqiTOUOYt5sph2E
         J9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF5DwBpSqEme56pLYLAgtXjKCvjXY82i6Skej2ujTgN11d9GELkhsHckotMJb7FqRFk5rK1AEqBr6h4mbpM5kpANYI8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbH8HO6DQg0mAPWstfA9DuFJFz1gMFGBZ3hEIv3zJvqX8HTnmi
	+aKYCm5GnWTc1siSSGMbufQ9y/ojMn594fTb9HcienYLH7ZgDXuLwkxub5h+GdSPpHySE9ta32x
	HTiR9CHzv/oYohHNYnQ==
X-Google-Smtp-Source: AGHT+IG5Ak+y0NsqThQ0r4o/665aH/C7btSt6+oGGDb7eAP6t0rwrL1Vx0qKYWSkRmlwXLgAu2h86m5nPyQnFjU=
X-Received: from wrs24.prod.google.com ([2002:a05:6000:658:b0:3a3:6a36:d12])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2288:b0:3a1:f937:6e7c with SMTP id ffacd0b85a97d-3a35fe67a7bmr21858924f8f.22.1747868889839;
 Wed, 21 May 2025 16:08:09 -0700 (PDT)
Date: Wed, 21 May 2025 23:08:07 +0000
In-Reply-To: <20250311133357.90322-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250311133357.90322-1-richard120310@gmail.com>
Message-ID: <aC5c1-VXoAIctyRI@google.com>
Subject: Re: [RFC PATCH v2] rust: list: Add examples for linked list
From: Alice Ryhl <aliceryhl@google.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 11, 2025 at 09:33:57PM +0800, I Hsin Cheng wrote:
> Add basic examples for the structure "List", also serve as the unit
> tests for basic list methods. Including the following manipulations:
> * List creation
> * List emptiness check
> * List insertion through push_front(), push_back()
> * List item removal through pop_front(), pop_back()
> * Push one list to another through push_all_back()
> 
> The method "remove()" doesn't have an example here because insertion
> with push_front() or push_back() will take the ownership of the item,
> which means we can't keep any valid reference to the node we want to
> remove, unless Cursor is used. The remove example through Cursor is
> already demonstrate with 'commit 52ae96f5187c ("rust: list: make the
> cursor point between elements")' .
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1121
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
