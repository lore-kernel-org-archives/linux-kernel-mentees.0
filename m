Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27A26B973
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  4 Aug 2025 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754321587; cv=none; b=ezvlceztQsdf50IZgZjoucq2zqfmJbofGRfAAFjxPb9o8ZbMRmJo1ANFGz4ekpeBIdKMIsOhtiBMuvjfljnHn2BdUm11gm2ucwjvSF9HFgn1SQtMaLjGx5bsfzHeDWYXsEm1DSPgJUftNbjAiv0FHpn9NakPIX+nh1FMH9Z22gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754321587; c=relaxed/simple;
	bh=uUkKHgrzOIHi/hAZ3QVzC5pF5jd7+2AosuCKLSA58Tw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PGkCCN4EPNGWyhWdzmUOg/wEaD6eA5kXPhNjmuALRaED48vCAbxhS5WQHQHG+gzwkP5Xa3Wc1MvP3KMKKsOPK80JbSxd+gAdxw1I0aU9X2NcIDhKIPSOCNzSWkg0cddQvOlrzsAf5uvM79eimD0nhgbsnLj6m/xkHEaExuCbUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nolUKFc+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nolUKFc+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7961cf660so3473775f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 04 Aug 2025 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754321584; x=1754926384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+WopZFLryciAlo72DuJ/q4cJCaS9uxI8zd7Jh9HW34=;
        b=nolUKFc+13FelANp/zWsxUVBtHUOZ7Hl//zHJbFV1KoAlk866EhUMHymJZc8subruj
         15bxTu8UDFrLlro31Rb0CLqQXSWyMWhlGRP8plV23aUZeTv8U6ajf853OpGHAeERwLpJ
         +wYWp9Q5Tc9mmlXVKr4l7zbdnRB4KPs5yMkYangGZONbmVw0DLLcAaz4RMJycuu3wg0y
         Tb/EwzvM8NhwqFai7lCdOVKBC8OCHv8ODNQqcF0+U5DhS353o21Se/D/HGkK6VWP7z+J
         XUVOMz8oEKRl5qy5wmqCFLHH9RWddqI8VL0s5ChDAeqinTC/a/3KqRPd9Tutj+AcexAE
         1kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321584; x=1754926384;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+WopZFLryciAlo72DuJ/q4cJCaS9uxI8zd7Jh9HW34=;
        b=uQZhbTBB+0Jq+i/00zinKxt9NB6dBMQtzBM0yjU3FYbcSy6OaBCZM1sYY5wktHRU68
         rUgtPqx5UR0IWat6HyPRPwvThGev2kGIMKVAFldUWQN3kOdItzRP5u/gre2cdSlxn9jZ
         TTOmsjvn+Vz3sh9KlKs7Yok/sTD6JWV3qaI2kvdrw5K2LFs/g4TYDFjZN4s+9g0GBLpm
         mfyCDu1Z3faV2235/+yWl9/F1/oVDabZT54CxgLUuoaB93SaJuHfdqPTpfHpT4PqB8r9
         3ZarH+OrOF9/vmyOXqiZJRxOudgs9KfGY06QZEQMjRrN2DlEpoXgjnUrNpwfUIur8f5D
         gq2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZHMJnU+bxOZ860RqbMWtWHMrPB6jHkynWlp5Jl1H6kVZ0wxfStgJ0fiT9vod++HnFr7G3pt38DmHW7C6hs2WI+UyDCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3C2pJm8aGJSwsYhwHzlqsmrtO7DyKabheiR3MijaXaoq/xV46
	Its/ox6CxhGSRMOUfgV+T/Py/t+2meyNfLy/93gVlkCVcwSaDlE92eQHmvPiKwzI5uQt0BGLOH1
	Xnf8Yl/Q=
X-Gm-Gg: ASbGncsN6eAzKVKZq/e8lFJuZcVGsiYxqH4qNJzasiCTbuBSYwyAs4zB8J/4AsCIUIq
	Uh+WPaeEgsm7QvgxbLHfvV+OkP3cISQaFIJv4iIHYvC5boCPxsEqJakMbR8KfhR+1ONPcTdO+bh
	vriTzebJ5MLjtEEmzS1OwrEJPwRcKxUb9m4Kb8x2LS9ZhxjoT6Yi+MRe8S8mTVTCoVqrOl1igAK
	E1U1/M8JIx1pl9nymv9Ija6Wu0tMjYRBzo5pNzHvxuVGtypJSCU88w//cRETXaZNp2sSCbmDk4w
	BhchMhJsVkJ7KuFqF7JcxTEQhHmzHyhBk+Q4LRYQVzf+FtcCydKboEjFSUO2K/HJ0JZ+ozjs7dg
	tKJzw1eQ9CkYd862ujc9XtA5AkJPjSs7fxfXx25Hobg4=
X-Google-Smtp-Source: AGHT+IEF8f1hU2BlwQYVtjlp2hUl6tPsOBX/61hQ8UhG3IJs/dhbSFdGfLAaTj/fxWh7CQaq0TRrWw==
X-Received: by 2002:a05:6000:2387:b0:3b7:942c:5447 with SMTP id ffacd0b85a97d-3b8d94cf8f6mr7300794f8f.55.1754321583582;
        Mon, 04 Aug 2025 08:33:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:33:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 linus.walleij@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 Brigham Campbell <me@brighamcampbell.com>
Cc: dianders@chromium.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250731032343.1258366-1-me@brighamcampbell.com>
References: <20250731032343.1258366-1-me@brighamcampbell.com>
Subject: Re: [PATCH v4 0/3] drm/panel: novatek-nt35560: Fix bug and clean
 up
Message-Id: <175432158262.3671011.5417242916841349428.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 30 Jul 2025 21:23:40 -0600, Brigham Campbell wrote:
> Fix bug in novatek-nt35560 driver's nt35560_set_brightness() which
> causes the driver to incorrectly report that it "failed to disable
> display backlight".
> 
> Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
> handling in drivers which use mipi_dsi_dcs_read() multiple times in a
> row. Add mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() to drm_mipi_dsi.h to allow
> drivers to more conveniently construct MIPI payloads at runtime.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/panel: novatek-nt35560: Fix invalid return value
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/125459e19ec654924e472f3ff5aeea40358dbebf
[2/3] drm: Add MIPI read_multi func and two write macros
      (no commit info)
[3/3] drm/panel: novatek-nt35560: Clean up driver
      (no commit info)

-- 
Neil

