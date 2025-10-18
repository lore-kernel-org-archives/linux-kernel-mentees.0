Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADB2192B75
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791819; cv=none; b=N5SISSabR5w1W1OlEooJ4Ey8EOXlEYyBhkbWS9WYLLZFer4ETZZSbG7ENnqaL+ogn1fFyKmD7aAzg/EP3cb/Qq7WAqefPzuj6r3xrQPixFbtoSJiiizXr5oZloopJDwtgWLEDjqaYLz/VpV5SXtHiIN8kADWwrH0FE0A2uJKg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791819; c=relaxed/simple;
	bh=JOhRgmB3DaDqj/0okhYJAPGij+Zt4PIUmY8n5GbX1DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG2i80suKD8N6wIopynaj2I9b4dKTB3ihrEreMdtTr1GJSnC3I88w+hvWeJy775+iHuFeAiUF0xU6Qa9H3o5r5KoCip0f6Sfoh1hQUpnXLH1VCAZPizwRLUid63NDjOwBfsiiOhhwb2FXK4Gvm3+SJ/koLwLRd8hjhxBH/8cBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ0xF3GI; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ0xF3GI"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b5f2c1a7e48so1778916a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791818; x=1761396618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYQhiSmjIKAg9JpgY81CKHBnsaXySUjIdDWp5EpwSqw=;
        b=kJ0xF3GIh2EIUnxoFWSAX1+hpPkZMzgs2YBNEh6BY0YzcmLjcd42P2Mv9m7y9p55ID
         G9iuQS4291+t+0LKn811uznur7UMt1E9AqDvHJNQcsqChYjIKxNSAlzG0kQnw/0dqYnx
         Gcm0TbdtdTE7yARNNdNefwJ3iyZ/EBIn4ui+F2nxgqgmyer156r37DFfH8Pbd2Cm1ouV
         I447F/v5VTsABRxhmHk3OGAJb8cAQ8wzwVeF7oIJJqlD47dgvthKgy1YR/hmsD4eeeEV
         tzdqdMuHe2nkgkW0gZQTXRPHJSFxyXUyzRR8lutHd7MgnNFcdL/tITr9umH2YoCGa3FA
         DbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791818; x=1761396618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQhiSmjIKAg9JpgY81CKHBnsaXySUjIdDWp5EpwSqw=;
        b=l9UPUuMGfcDrfnFJsJh0Cn8RxtGvPdaC/zWmse9IVMSDKgX5mVM2mrtCHSeNbz+eeP
         om1udF5d8t0AG4T7/Q0UiZUAyobvNRzFLKM8QpZ+JCH4AYdbeQz7m64V8ICu9h4wGdBg
         VEM1v2bj0rR4kF3swR4XE5oK52vmsPg8xPINVQ2HxLDPqgQ553n3orbVTkh1pDBIDwGw
         1Y4yKNQ32mCmI7o3paJ4s4AhhvAO7jzxuLn+urx30AdQKiKMLMcFjsMF8wYfNJ9DBtyz
         XwvkunBRMEeQO0+uYHO4mKNlou5r26weGR7poUod1TIOAc4q5IvH3fVtqdWwi+igXgcX
         wk3w==
X-Forwarded-Encrypted: i=1; AJvYcCU7ayp7PvwbZP3/u7XgmguYpOXElu/liXXBN3Xbz0jB9Pj+EzGAHUfUIWhH/FIda5HRtBODo1FVsxS6249P1DUa+syCaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZHi4FADL2blJ+8mn3vnzr136UTtSRLekBNd+8V6tSD6cV8ZT4
	4B/EaTncF0qc0fqqv2cX6xt24BOxDbT94ZOSlGoRJszb691xbpOI5W2GFhi6Rw==
X-Gm-Gg: ASbGnctQcK7HiGLUgsoxw1i7ojsud9sp3m0V3j945Hkl3BxOeVazSuebXWarMYCzPyk
	MaoaqovP87kozPwNQrAJfnrOIYd215vXkQ7SKDKI6EHGIc+ypJO0Bla9qx72/C9hAypZCOaPET/
	1+8VUQ2S5icwGbeClYlbJ9WKxmYW+/yayqCVClv+gLBP/TKSEA+GQsusxrZwkAcT++HQ2BEG6nu
	HONnzrU1hL4WKc9Gb2x5FbAnV1/vL1jWt9JxPiMtevBrp4JNl0/4GjI3FkPj4Yy3jeBf4F/FQ24
	3lZPNjH8tNuRmgExL7fq9qS+2+j+HyK6sO7vGv0opjNeDFYWDcZBJ3Q42O52f/9rXZaKyQxSxT6
	N45ZsWZO7p4XPfa0s+ORWdyivtLY8hbbxJVJjhGYHtRy2va6YxCZhduuE9ucgr4vqKmdM0ErDw7
	TzQMm2gy6m2KZDB6QZNuAS1zSAmUNobl8XOA==
X-Google-Smtp-Source: AGHT+IFp+N9rk211Uet/daZeKCeaXRrs242HKJkWvO8lWmZmRSdRDNcuzgrJxXar0a7TiUsx8ojtlw==
X-Received: by 2002:a17:903:2b06:b0:272:f9c3:31fb with SMTP id d9443c01a7336-290cba4dbb5mr86424535ad.58.1760791817569;
        Sat, 18 Oct 2025 05:50:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdcf9sm25575825ad.91.2025.10.18.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:50:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:50:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 2/3] Add missing datasheet links for Maxim chips
Message-ID: <6e12dd80-e02f-42cb-848b-6c79378e25ad@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017161422.4404-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017161422.4404-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 09:38:05PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Missing datasheets now available at Analog Devices added.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
