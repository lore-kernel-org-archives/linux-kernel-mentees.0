Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C41820ED
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777668; cv=none; b=EFFqbXA6IN3bNQZT0R21bypk4R526Qi1gj40sN+qGfNy9/0vS+yQDNC0wNQKYotxfvrsVGYH+iwxo5y3LjapQYdqdHfHg4oqhClhGYt6Ithj6a34BiVFX6RYTtj73P/o2AbF+FFsT9B3UphIaAeNbxHji3LnPQNPAta23QQjOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777668; c=relaxed/simple;
	bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=D8RzeF3eWQVB4lCP7hu9ApLoJNv2WK3zcVi0OWxwAR8vD/TgiGPWVRKHGqEqUT6Ukh13nyvkqCW6o1zWE11RbxRHNmaryuxDwErc6KylocuVUsaiRuT26HXhavWEn5yg5mb+D+AG+7g5BnwuT15CgE7E4+UwNEU/nsX21OAuaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=S02jA2CD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="S02jA2CD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so1416329b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 11:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752777664; x=1753382464; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
        b=S02jA2CDfETcIPXmGyrZSY1qRetELkWBgXq9OeGejEL62XvYMOwH+F2b6fbQj9Iy8T
         diDYemBeyxyT/s8ukzgeL7o8dDDSnTlRqe0qvdXWnAnffxOBdaY5NNm4QCnoIUgGISCc
         fvi0cOJvTqJAOkphRkKhPzHTKNKIZ0LoLKg8HExwj+YeKcS28dhIPxHSeaoBjKa9Fw4E
         ciIfMX3Vy2cS8BVzt1h29TsXqgrHFgtbzMBBrCH17bFhrnUWA0nSAyDUyzZ+aPUmdQh3
         jpfNodYP4UsgfppdJLPPdoTnxixBWWZPbBJZhX9L7b+sWwOX91z3LeNlCaDSPq2AMjed
         tm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777664; x=1753382464;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOsxMfNQT/qsQwwKg0YZL6vPa28xMbHs+2C6Y8zV2dw=;
        b=G8DMgUJASTlROr//JYkotb/Yd+e5GuDNU8LSLoT6sA89XqQFcHHC7FVnIMBUse0EDN
         o8QW/3VcGD5a20O3gt9ZRcH2HybHG7CliPFXK3HzfvS4vjc+Y6DR0zBhySxetVP6WAiQ
         vnsp3lDelTMUjLDMxxbdEZoYHhLIzUFeCy9ZatklbrBm92GFW2SEe54rVv5qJApC3e/H
         jnVOhYTliCkkOPJ8O47XZGsoyX0TrhlFracAuyM2/EmuGEbz/wli4AQO3+BPq86dksr6
         xRdfYntfOpyG9corkmeaBu3mwnAWx9DafkCvOVnpOtjvN2boYrJcvj0YBgwhRFRohoJ8
         kosA==
X-Forwarded-Encrypted: i=1; AJvYcCVeLumGJmcbtpxMSNBz1qBqrdgwW5j+SPYM384ejDVPG7pfxKKJE5hoIjHAlSZ29UBs96zEaIxJOL1DNWjgEr4D/zrFfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy63o/eYZ68ZtyjgqYzz+loHRTqjQ2mnLqOnueOIdf7NGrG3fP5
	SwTLegLx6RbKvnimYjjjK8g4Hf+l/YK6XjiQHB3Y1Vek20YzceETDZirZKtBiXVlOG0=
X-Gm-Gg: ASbGnctrDbFyZ4mO5tT0PKd0mwRGeh2nEIy2ObUjRcTwKhpF2mSI6GcXNMiyAHFgihh
	CI8nvqTPG10E8BS9Uc3TNKvtQ0yoyD6bgSkFXLkfbL9MrSezwwRWH5VaxdOj8YrKZ2LttMtbVCt
	PcMnM9pOgi2duJvsg7RYgmLLdVT5bTbR9xbReBKKPWuePqmn+wELHmsaYKdXNEwuaL3ZshlRI1o
	s9MD3mkdedWkm3tfHx44UPpgOTgFHl+eeld21wuksx0fTtgvU22gGoQJtJ1P6Z3g1qIM9q3horR
	empZNO7Z9i081TXSqvNpZJE75xm2ra2CfhLYKswjAaB519BOV1O3l7rD/Q/EsD3zAYb1WQFc7BB
	cWQup7bxFrFKDumC/uIs=
X-Google-Smtp-Source: AGHT+IGJSiqVRqEqNHtQKOugHVGaBNjYMDOrySpKjtT1rTqdZu4A+8+NkiaILNEtNNDxpHEp7TmBLA==
X-Received: by 2002:a05:6a00:814:b0:748:f3b0:4db6 with SMTP id d2e1a72fcca58-756e99fafffmr13108030b3a.11.1752777664328;
        Thu, 17 Jul 2025 11:41:04 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06890sm16623945b3a.48.2025.07.17.11.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 11:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 12:41:02 -0600
Message-Id: <DBEJTQ0J7H88.5X7XSNC712Z1@brighamcampbell.com>
Subject: Re: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI
 support macros
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Brigham Campbell" <me@brighamcampbell.com>, <dianders@chromium.org>,
 <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>

Woops. When I copied over the subject from the previous cover letter, I
accidentally overwrote v4 with v3. I'll issue a v5 if that's a problem.

My bad,
Brigham
