Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA4147A0B7
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Apr 2026 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571828; cv=none; b=Sjd02Th/DXYAHu/K7zcQxOsXsGBbIcBBuC8PytDcXUd23xsqR+pl1uVe2eR24VY4qVB5dJpPQHWn5eura0ODsZ5s0iEG7nwhTOGa7xbfXVmoM/9qt4QobAK1U0MtxAYU5b5+Q3sGgfJX+rNzBC+BQ0F08Ul1wFdBZtGiH5q7sjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571828; c=relaxed/simple;
	bh=Si9XWxBGvLrdQNvQasBTMwVASAqKP5AP7jxdKns8/7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjMbVs1SqyBURBfM2oIBjbxbPfAVONmqD0341Sr7da/ycTr08G0tVb6vj9MZ+qU0HuCU279Dgm7ZONC50gLDy7aOritdlgy3LWPUzbR8CVkAzyUZB+uUWzGFX0fCUeCe3jAdvp+5U8TnwSdPHrAdV/cigBgr1ww2KGMfzUHTGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI7fk/gl; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI7fk/gl"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so870692a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Apr 2026 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571827; x=1778176627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEldV7foT5A232kDq0rnyRxuh4l0nSkVnRNp+w8Vwlc=;
        b=LI7fk/glPfG+nrlXH9sk04HsuuMQ3qTDTUWFkGgHgmJz9vorXONfKBn0j5Xj7kIt6T
         hy91WJwayzfLItjE3JhcobjbgzJOytI4L6RXraZACTnXLgk1TctdC53Xwhgpol9OBkGC
         psuWu+ssvwzy/p5E/uuGlMEOIi+SyhE3f3ipgOoyNiLyRVRI9keSgmWMO/ZBmG/T/Uki
         LYBQFefmzPjFCiaBvglRv46/vC+jdHvVFqmu95GOdpaf3jfalbxQuwx/Z2/P4ZPwassa
         KlbDse2+Sg5aU9OWjOVjuvPG7MzW3bGvHdueDBZoRH1Yqc8jr//S1hwvbVXdkHJQaSff
         Uj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571827; x=1778176627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LEldV7foT5A232kDq0rnyRxuh4l0nSkVnRNp+w8Vwlc=;
        b=Q6handKb0B3nduHGRrKdQdqGXAqRvcoEbiQLRizPJtyU72ZoJwkPgFXNnUORxk9oAn
         bH/VLNNb6J3m0x35G7AroTr4v0KTvdn3cz9TGReuLQjMGs6wBCEMniRmdIv9iUZcncEN
         2Exzw9e1at9sHnCbunUCel1omQrZXG0ur1l0hs09JTg2kq540Dj3R8eDab18qRSUWxWy
         464wtVZvDR/IdBF382WiUZ56N4KYOAPROHr6kQ0ngELgSmTRhXyUadQqak5iT6LYfHSs
         k2mydcXAIPJXR61ov3x9XqkLpNaisqwRZiiEToqt4epIkL53K/U7VpQoUXSdwlpSgMCg
         d9Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8s6dmwtvwaN9tH50Z0B4xi289OXV5HfHkzQcAuo7XOGkvLqYJVovU4J4fSqqteF/wOgV/HQwVe4itK0vb9gtIhhsaMRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Di+u/Z60NZFYvyVJWvk6rwdzyK7YmocEsbfrmSpyNHOhM0vK
	9Vx0hS7uLa1ovHP4n0sGbxMNVreoTHtQXJGvbeehxe8ugnnn7qCna2NI
X-Gm-Gg: AeBDietSoHIC1pn0kkTbPVb0fRoO8AdWG1SWcBtpbX780bqI5k0zjrqgN21PI+esm6k
	YDvqP1KegG+b1DpJ5yf3Vb5Cnjh/K9z52n55zwKUjbcfPl8bujKVZ44YcjPZbO5bkkCMBhxD1FF
	pmDIpkufgDqziWjt8r1fQ5g4DR+3xtwBoR5YLMQpjLPE5vtUuNV7WOBZZyKX/z41q4INirIqOds
	0d5IjPXl93Ze6zKQVCmTHRLN/JWa2eZGM06eQcAGK5CGsS7scIQAzZyyS5tfiUdy+EB/wwd3+Cq
	4GZux27DXa0nq4eyTXlREtzQSCicOTqwSJYRDAENQBt0K8x5vXyucQyVcKIxNouITT3Nbbfac7S
	OHlen1YT/KXrozt8i7DJOaTOqbqpilFju2KsCvIUziclS9mEi8aqEKuUPpnfWu/LsKb/s2MPTBJ
	D+4hp0So8QhTRLm3hscCRIyo1USXrbsPGtrSGBOQa2SHtsRmM=
X-Received: by 2002:a17:90a:d444:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-364c2f8bf3dmr4137344a91.7.1777571826829;
        Thu, 30 Apr 2026 10:57:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00a280sm53136a91.10.2026.04.30.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:57:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:57:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: sergiomelas@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation: hwmon: fix link to ideapad-laptop.c file
Message-ID: <30d60aab-911a-4009-a8ad-393591baec58@roeck-us.net>
References: <20260417191411.713958-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417191411.713958-1-ninadnaik07@gmail.com>

On Sat, Apr 18, 2026 at 12:44:11AM +0530, Ninad Naik wrote:
> The ideapad-laptop.c file now exists inside drivers/platform/x86/lenovo/
> directory. Updating the GitHub link to the correct path.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>

Applied.

Thanks,
Guenter
