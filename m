Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0113314B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426025; cv=none; b=g9s2JzEj4UK3RNa66gmmfwDR+NAK6bo8L/7PaKH2VEhVwbLElE+y0vaLw8e5qiauUoCI8Dom6cJEZYO21S/UQ0dL6gEZ90gEG2KAu/OouFgEcJOxLR9x9Dv8j+EuEPepkH4iCJ/BkN/H1bX/VNmU3BpDw9dktlG/mG27inyVebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426025; c=relaxed/simple;
	bh=FX+u7dLDurNlxOccyfrLQ21pHfY2VWLGsQf174i4Ot4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LrqPrNsJhV7A3ggz47xR0pGONangkS2k70G71wVzZf8vA2v9Al4OhdTxSEkslKZWbn9RGmuT1aOTGLqX5NhR7Q9JcodXbq2QwtCRUzI1Xm1BdppCEf1JYSj8zQ+RiKIpjrcwmaMxxMEtfBEtMC6CnCyq2PrYUz6Y4s+0NDhura4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aw7UJlPH; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aw7UJlPH"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A24F60B9A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 11:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AINWPf6Pmprm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jan 2026 11:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86D5460B99
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D5460B99
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Aw7UJlPH
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 86D5460B99
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 11:13:43 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso3782736b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 03:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769426022; x=1770030822; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjrX7lfZ60gmKC1KhjPLhFh8kl1ZoOz3IaYZdZMcIfo=;
        b=Aw7UJlPHOZIR4gPK05N1qM2PX4/raGEIDDn0mpIiqMTOGDR83CpmPVC34/YsJ5YQJq
         ICkT4YAfyf0V+wWyPYXhZQ7YDj08Lsgzv/sliqbrqC1FDLOfPypgNMTznNUw5XpeQSmV
         /bKzK0hxy3IcXPoqdhwCxagWCgKKGdyfrv+vWC4i3nitgT2UyLdv90s5afj8a/2CKw3W
         f/fDeQj5h1oeW47SA7U3iBnsiifA7yGUJjnihcLmMwlSYpLTvzIScTwpbwD6U3y909aF
         zIzx4xzeWeFfDrg7mfSd49EjNK+KeNMFp390FF3LTc7d+c/ddaljMuTqQKuKRyOVStMm
         DiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426022; x=1770030822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjrX7lfZ60gmKC1KhjPLhFh8kl1ZoOz3IaYZdZMcIfo=;
        b=oZFfL3hF1/0bP8cbBv7Ar1ZQlPSuwx+rSfHnJP9yvWphuNt5kuijrKtjgyYOWgly/A
         wtYvaabBlb65Jv8IdzQjOScINvtH8HW8Pm6fWZQAv+6mMSIi+qURLpRLWS8H2k+OqZ9S
         0UNWfSCS4PjVWcei1A5SY1UN1V41aAoGLxtzJZefoSqs+l4CHPRaTFkJF46wT3K9iqFf
         YOoeJ39fhVsKTUvZOrPJP/HfgucB27QHAQSwPFH2dtKR5VAXBcgh133QXRXn3sst9eUE
         L0Yl45GBukWuvZK1jbVhIw25ACL9Gj9NzYLeBlS6qwkdPYy6Fdke7jBYu2kqu5IkmP0a
         8AEw==
X-Gm-Message-State: AOJu0YzcuEPIaYPQdEqz6SjeM8NrMsBBR2ElYhXDiJpAjFu6lefeO3t2
	/J9dD/Am3NtqqjhqxpW5fVDtXxFEqLucMo4se17yQfM68l0Q8TqAeyXcCtUC5yDL
X-Gm-Gg: AZuq6aJF4XBcnWOGBuXFwQrCELH9ELEy75DL1JHKXCKUWJg599dG/RG8mr0HAypPuSD
	D/eCGvaPFge0jsbNQwj/BzvhPP548Ub+zUL8nh/giWTz/+hmgv3E7A+7YUjGQRQHWqdT50S4xbf
	DUNnBw6Wj9/c7mNEY9AGkas6OzIKs9LWFOe6QtsvitVa40FXWnz7+U01CXbJw8mO8EsL0zqYLY4
	sASo0ErSIuFlMSJI4JCTRezPZD9b1HJ/d7p3VdWyqp9J9akPWi+1Kk2N1tkRjZXizbE+Uu30A8W
	mFihPi9iWDsyqmnP2e/CD8Wci9yjBsVnvzgOVUJpRR/TTixPihCZVyqZFYJBg74eaGxAnQqivp8
	18Oor1agMhzAeq+T5/XhwUIDUxtRtejn/GdXqJlEnMWfuSMPz7v/iJSbPryfZCgEptxXEy+WicP
	/zQs6pbI8aERqALDlhnsU=
X-Received: by 2002:a05:6a00:218c:b0:821:afd6:c6e5 with SMTP id d2e1a72fcca58-823411d83c8mr3791919b3a.5.1769426022198;
        Mon, 26 Jan 2026 03:13:42 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e903sm9068178b3a.51.2026.01.26.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:13:41 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] docs: bindings: da9055: fix dead link to codec binding
Date: Mon, 26 Jan 2026 16:43:09 +0530
Message-Id: <20260126111309.22097-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The simple audio codec bindings were consolidated into
trivial-codec.yaml by commit 4acbfcf11cbe ("ASoC: dt-bindings:
consolidate simple audio codec to trivial-codec.yaml").

Update the DA9055 binding documentation to reference the new
trivial-codec.yaml location.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/devicetree/bindings/mfd/da9055.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9055.txt b/Documentation/devicetree/bindings/mfd/da9055.txt
index 131a53283e17..d3099bf56002 100644
--- a/Documentation/devicetree/bindings/mfd/da9055.txt
+++ b/Documentation/devicetree/bindings/mfd/da9055.txt
@@ -15,7 +15,7 @@ The CODEC device in DA9055 has a separate, configurable I2C address and so
 is instantiated separately from the PMIC.
 
 For details on accompanying CODEC I2C device, see the following:
-Documentation/devicetree/bindings/sound/da9055.txt
+Documentation/devicetree/bindings/sound/trivial-codec.yaml
 
 ======
 
-- 
2.34.1

