Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A8F20330
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748293855; cv=none; b=ezFUztFH/PHqr1OuEmneDn00Mk2bvoNnNkqPLfAOUVbaBbOvJwvFR4/KF8ygNKwVbdFtCREbH7U4aDZAXkRPhCQspAu2+5F5H/3SrpyReAk8Hdz0MIvAZbnsS2C0DsjrLtv2LMVZGbPh81zWZ1+4Bcmap4VtdZJox/BzfSknPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748293855; c=relaxed/simple;
	bh=NQv95qdsZDm7Shp0KvjsvOQwl+iLO5pD5VPSgd0VJI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcGfWEx0ubZ2X0udMiYAC9uUUFXa6tHuEXdQv++6m0dt0djYD15TSMZRmEtkHCGjxkm1brhl0pTKpAwtGnC2OeCOS1N9gb439MLBg8Uk/qX+CcgHHoL6QF/xP7wBRkpiOyiGpiRXWn6WlxDaELqYYAcesIMzCTI6hMchasphjaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZaILSrf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZaILSrf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so31701565e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748293852; x=1748898652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBGIx7uWt3EonOMrx30eCVRGWzbw2WhynVite24Hqeg=;
        b=DZaILSrfj7ZCogU6INpcTPtdf4iV5Bab5BaS3i5L4O8/h4BYkUsrq6/5mHuC63mG0M
         pw90NGUygYm3XNQ8a+d32kFx1EymY+BL3GMYWZlkmALST+T4mRxs2DixzV9jQndKdXI5
         NJc66LcG26V1JRtsqf0GDN+gv8G4Un6eyVBwUcxC/BbUJswrABQdNXXT3hQM8BDfKKa7
         fsDD1W2R1+RpljZM80EUI1DBr+h9ut0abZzuzUEUMscIThvatySkY/fwKI6qRQpagIq3
         g7QeW+fG05jnibMODIwhB1a5tfiPhA9heQkNNtUriwBsv8Zb6o9APZoio/0IWtA4VKFl
         nOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748293852; x=1748898652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBGIx7uWt3EonOMrx30eCVRGWzbw2WhynVite24Hqeg=;
        b=uucYE69Yu7/1xSjAwktJ1p/VADl21dfA9bUd7pkkqIuDEWxPrUMkNSDfr8kR0jl4Za
         AjgzAKiZRv8w6IQsc9QQwMm+Hdvax4jNvkGKmXCBUHBaqNrGd4s0/AxZrUVrX4MEN1mW
         LJYuyEXYc1eK9gx7AhedtmDv3Y/hsFsgn+XxSt9c++1NrQeAsiInmzvWMvZl/d/MkwP0
         AKFveeRzYbo1oXOU2EaQT3QszMERxBvIItFrbgIwYTCi4n7/uqhFP/UHXdDnluDQpEDp
         8IOCEeCh9llzY2ImgytEmlq+FzanDXGBl6WAo9SWT0xSF6UCj1PM9hjoFSnBNEWbxik1
         6oGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHsJcUeG97VB47l73OI4shM+PQGeAt93QW/4dTiu0xohbjEeOaSQRmr3qff1INAv1b0aLajyvEG4ToI23dSW93gLNzKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNOY9bpININFiPbHJ4PKO6fdu7SU0HLheHcjckcIoncc+GaszK
	wPciQVP7B4yYNwLaJG/ooYSX81SsPdUnEDtcsZDORgeJQSBBwYVwJ8Cu
X-Gm-Gg: ASbGncsxsp3yfEkbkWX8Ea5S8LMmigeSKFOWv7BzqdYtVtyOh2avGp9T3RbnzTOxUd+
	VaRGQzOnctfpW+SuFCmNheG6WnN26ntYtk5J9S0kqOhyCYvGOuAhZAihgMt15Jj6ickl1Vgrrhn
	5xDFYEqj6iQsP+HaPNSsaAn5kM4ZiRKb6oNlHvnOr8UX/mR/e/65YF33ibIEls2omdEncmU5Zew
	xud1v2qzWCIAJjL1O986V41ChqHDxsRtbe7Agz0EgGgV1yOCk25rFGhNFrGPoEeO0TGcEKEi+jj
	QnzbX72XyxbfeHfeg72cpLo8Ro0sqfCVy2+0slv91ot3Iq8azmFWZXqHup2VgVLjuutk7G8cVUb
	LQw3VmmyFduuL
X-Google-Smtp-Source: AGHT+IF+FFqC1DQtqV1gqOYkFWdXPnoibRiEGnuA8xYE/v2oRafxLw8d58e0YatLVI8WyHR3jm9EBQ==
X-Received: by 2002:a05:600c:5618:b0:441:a715:664a with SMTP id 5b1f17b1804b1-44f840b38bcmr16410075e9.20.1748293851445;
        Mon, 26 May 2025 14:10:51 -0700 (PDT)
Received: from localhost.localdomain ([154.183.23.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc932836sm8728503f8f.39.2025.05.26.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 14:10:51 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: linux-doc@vger.kernel.org
Cc: willy@infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
Subject: [PATCH v2] docs: symbol-namespaces: fix reST warning with literal block
Date: Tue, 27 May 2025 00:10:39 +0300
Message-ID: <20250526211039.163449-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
References: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a literal block for the EXPORT_SYMBOL_GPL_FOR_MODULES() example to
avoid a Docutils warning about unmatched '*'. This ensures correct rendering
and keeps the source readable.

Warning:
Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---

Changes in v2:
- Use 'For example::' to create a literal block, suggested by Matthew Wilcox.

---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index f7cfa7b73e97..32fc73dc5529 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -85,7 +85,7 @@ namespace cannot be imported.
 The macro takes a comma separated list of module names, allowing only those
 modules to access this symbol. Simple tail-globs are supported.

-For example:
+For example::

   EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")

--
2.47.2

