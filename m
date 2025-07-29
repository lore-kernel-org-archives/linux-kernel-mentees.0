Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EB23DE
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 17:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753811388; cv=none; b=fJMAL74TRjhTeDdkmZSC0Q/aRDmhBiNdZpUrcbTT/0xnj8tv269Pqb0+kYIIQ6Mf1J/4VW8kXC71bSeUqjyPHQqZMYYsnrkkELRuWDRGANJ0e5D2tMx9Jl1pKNZ3LWxO0MR+P5iRZ85RyNCQuWXKOwEZCysnMfMpYchtZ7WY7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753811388; c=relaxed/simple;
	bh=mBhvRQ0nG5MZFbi8opUSecvTUvSr+F+OxUXM3WaSTw0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rxUvJ3cpY/aTsiWz9JOe+kY/HGXGROp25taYyqVbm/zFMvPgItoGn48Q6ceJW3Nxm5NP7aDNdzVzqpnUMJmO21+SwIWw+S6V68vg8wSBvp41yg1QEmCDbrU2wqDHFWtsE7SSRaM2e51zsNYUOMVxgI6SoCG+IyMwkJZyiwi7N70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=HJ4ZQW+k; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="HJ4ZQW+k"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74924255af4so5011121b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753811386; x=1754416186; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgacyD7+JSAylz4eDUPZatAHSCWLxzjQWqg339FTf5g=;
        b=HJ4ZQW+kZIEGSz+U8aJ0QFUv2WGe7FXOxPOUTD9h2atTU77ov4DfVE6WDsnhhHA2RL
         aK4QH85SSwavC3/3kqYioZfWWujWuQcI2EetY+huIxwbGRjjzN+yPy3ftPuYMmDI/pyB
         HZurNUh3F0kdr0KSlQuHXwR97onFrBtouIR3U5EPJfUREddNgF3CmYUWST2UWsUFNqsS
         eWVpaYSkcIVzuHt7deMtHLKHVxUqfDYNN4spdI1sekL6x0q+VxE3GDVpot1FeDyh3VM3
         4ldOxKKIvsGlK57sqvMSlmY5Z6n4jz8wtNT28fCEn19VEKYiOWfN6+WSpV2ZjkJaqVGo
         AvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753811386; x=1754416186;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgacyD7+JSAylz4eDUPZatAHSCWLxzjQWqg339FTf5g=;
        b=KzJv2oh0KSkhD4HrFcpjaWOWkZ+3smRTt0cKqEFjZzehhwTcXpKYqrQdeXQYJAZWnF
         54UQYOTWTRq9lvqLvvCNJVh9ymSx86TMMjSdXwHo3JKWXovmMtN8U+OS7Ai1gfd7CiGs
         IFZ+/Acx2eX2R4kHzCBXpQMRoY3lriX1nqjXI8Qnron6gc7dyzo1Ty1z6BS34Ta25sKM
         GKL6B3hWI4AuYlJwg8uzcG63cho/ugvBjgEqarMLVQk29fvsfmtqI7Pt9QtBkOC2E9wL
         iADFigAPb8W+goRt2ilj6KuH6yCJNnbQqfQQq0zcHNitMFZ8TgRBdLKFlAVpD2UL+wUA
         em+w==
X-Forwarded-Encrypted: i=1; AJvYcCUAm8QW37B7d7FvjvX930hwmhxyXn+SY7+4dD5ca75iWM7EeVIpi0Gvuw3tcyhcAlW8+ItSFl20f9tHqE7eEv7fzadRHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWzu9pf9qKEfXhD3/DOWl4NfhHXWExSlPLZr3PryDcgAO8W22r
	rQyDluSCcAg+F9CLiUGOPBSrDo0SzxcE2U6asehTDQ78VS+CmCSrxPd18DjHkXwARp4=
X-Gm-Gg: ASbGncs6wws3gsk2v7Dwjx4CBdCDjrYFHW/EPGI0fE+uScj5joEyg2Sj6pnDgoDBVKx
	YQXtUFwY3OfA4YKqEOYGlngSlrePqvHphEBMWX53a6AOycitzL4vD9Z7umdb7TBF1wNCIRX4N+i
	VsppLUsn33UOBVni/3Dh4Z4r0vUqYAbqpk6uUvOdWtlPiqERjkd0XB8RiMuvw/pV4WtayjDH0gW
	ZKfooFrum1HLKhIB1pDJe95y4g3Ptr0v6SIZK46gzY4wxwmLW+dpOAmTTUky5SJl577RYrs1h/t
	+oPH32XPwDAIpfwcHVWAaUj6sRRXBSLVNfb1lN2Vvymx845XYkuZlnMak7MY067OtUN7g7xrQmw
	ikltMo3//m1yk4O//OX8=
X-Google-Smtp-Source: AGHT+IE9oBm8nKprL5hGjNglF7y2WycqTKbCfeajSJ5D3OE2VH/J46MKc301lqcU83YSu4cRzCgpQA==
X-Received: by 2002:a05:6a00:1991:b0:769:999c:eec0 with SMTP id d2e1a72fcca58-76ab1020b1dmr787520b3a.7.1753811386500;
        Tue, 29 Jul 2025 10:49:46 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6af886sm7347239a12.52.2025.07.29.10.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 10:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 11:49:44 -0600
Message-Id: <DBOQ8Z69EQ52.36Q5O3T140OL2@brighamcampbell.com>
Cc: <dianders@chromium.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729054435.1209156-1-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-1-me@brighamcampbell.com>

Oops! My apologies for forgetting to add the following changelog to the
cover letter.

Changes to v2:
 - Separate bug fix into its own commit for backporting
 - Add var_seq_multi() variants of MIPI write macros for sending
   non-static MIPI messages.
 - Minor formatting improvements.

