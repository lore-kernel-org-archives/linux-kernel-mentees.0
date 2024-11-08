Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2DD1E203F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055123; cv=none; b=f6kHzy66w8sNrQ7uPgMyVJS34HvlflIhsn9Vnqb8ZoYUQRjRbfyznA6hkDr+qMYGWwf+DVWdSZAaepWLf11oFJkv4Ule71MUuVpq6ni4Cu76xwMG7aU21k2xyLtk9bwgTthNXvWvLWFK1EM1wL40NxhGHTh1hvMviFVg1fIJYrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055123; c=relaxed/simple;
	bh=3snwBfOluaLLaBqMW2z9kpc27Gve1ktkYY+R204mCq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dtA1/ZrW8QoGGvuIoPh6MLp0fWoSZ5NsnsPdx3QqcpzyzqjtKJodxi45zw0pW98UftzShJlq2YGw+RH22rU0F5RIYGhYsDLKxPC5accOW2iLM6pOHSL819C4xZQNawCe4KpDZ93ah0vl55UbM+VgPAvFJ1nQvL5n7Wu7oSflVu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMa2WYgt; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMa2WYgt"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC2B6119E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 08:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzmeFQ1MyLq9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 08:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 730C961198
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 730C961198
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kMa2WYgt
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 730C961198
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 08:38:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d3ecad390so1709811f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Nov 2024 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731055116; x=1731659916; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTOcfwig0PKFL8PVkUy0lEQsorDf8mUsKxkvyFmWiY4=;
        b=kMa2WYgtUdjlmjegOgA/DTewwvfizwV3EHffr1V6fw5rtexrjUnJ0wkEbAJvXn5OrN
         rZhgunVNrJeV8ACZXK4B5qM6cAaGp15eXwofGTgD45MtNZ4ceAOxI/pMLZeLSX4HO6JA
         OhTHuXoCb8wBARpM13udgHlDjeAWow/JXwTndU/qV+scb0bcyGgQfwde0cWNe5pDZPnm
         svzkq3CQcSw+2c5YUJ/i6Wk2LXFonM/h2BXLSqxWZEAceL3pUCKqcvOMtmBz+75lyI2Q
         zwQ3xPzbOX7AVCQ4FaLmMSDMtJ1FAfAdF9d/vopE6Z2Z7tzL7vkI1HE9J3IQQxt9TVO5
         wdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055116; x=1731659916;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTOcfwig0PKFL8PVkUy0lEQsorDf8mUsKxkvyFmWiY4=;
        b=Bum00ty8ZRUnoT1VvSIWujgwQeF9PWx1aMazFb5JdLntfhvtu6zOnCSxViNj+TKsF6
         XQ8q/s54cxqZwtuPPMAQ+vnpICGCGdbuQNiZRH7HqIcusRtbbDaOKFxp3+hPjgAX9pEi
         SZxxY5sybZnwGTK6LjjFV+DoXZamOfZZ1zvSHfx1+/X1Kibpc8PfcbAfH4+D64P2xPW6
         Db28mizXnwjsoOoYEA7EfjCwJ8ePj8tf9d6Oh4iHknzZO6kLNWU/bns/y2VzFRy1nw6y
         Wxc2wJrQbTNEjQCw/vgq8sTA5X/CQq/ovUpR+o+cbednSzeeQKYe5TWqwHfPJHycPK3z
         1Udw==
X-Forwarded-Encrypted: i=1; AJvYcCU4z7bqncTBefWfipFFOT1JmFGRLFl1kt+PfaWhYyAhuO3rHGuHebWm+KUjWE1jqOJKr3OGK73xRgmuep4TmEjB9E3KcA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxQ1NlZgB/3GU6GoESOXF+Hs+Y5p7e6/mvI6ftK6aTN4qTZQX5x
	7BwIcmNLwcEgRO5Mj1mthOIa8wJiDIhchVoSzen5c2/tSOpBFeKAHhHY9Rq02cHZmbdZK8bkWrt
	bffCSTQ==
X-Google-Smtp-Source: AGHT+IGjJsYkKtS++GK0c6xcy/PKYqPkLYH/DrLydQt+yXOAMvFiy8YV5KZWq/ekW1oi9PjQAEWzfg==
X-Received: by 2002:a5d:6f1b:0:b0:381:eba9:71fc with SMTP id ffacd0b85a97d-381f1c83b8cmr1500678f8f.19.1731055116277;
        Fri, 08 Nov 2024 00:38:36 -0800 (PST)
Received: from aspen.lan ([89.101.241.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05f89sm3889986f8f.98.2024.11.08.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 00:38:35 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net, 
 linux-trace-kernel@vger.kernel.org, Nir Lichtman <nir@lichtman.org>
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
 dianders@chromium.org, rostedt@goodmis.org, mhiramat@kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20241028191700.GA918263@lichtman.org>
References: <20241028191700.GA918263@lichtman.org>
Subject: Re: [PATCH v4 0/3] Replace the use of simple_strtol/ul functions
 with kstrto
Message-Id: <173105511502.10030.8958584403113767756.b4-ty@linaro.org>
Date: Fri, 08 Nov 2024 08:38:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Oct 2024 19:17:00 +0000, Nir Lichtman wrote:
> The simple_str* family of functions perform no error checking in
> scenarios where the input value overflows the intended output variable.
> This results in these function successfully returning even when the
> output does not match the input string.
> 
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
> 
> [...]

Applied, thanks!

[1/3] kdb: Replace the use of simple_strto with safer kstrto in kdb_main
      commit: fe0c87871fc0b97f6d374b670c81f7c4087eebc5
[2/3] trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
      commit: c56642c737fc0bd9bcc3a22a2bf8ed6f5900a660
[3/3] kdb: Remove fallback interpretation of arbitrary numbers as hex
      commit: 5f4ca702e36893a276fccb0aa55ab36e19dfbb50

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>

