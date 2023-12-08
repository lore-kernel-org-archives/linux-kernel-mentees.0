Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858D5AB9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 23:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIzIRMDJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E9883F59
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 23:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E9883F59
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fIzIRMDJ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZWqMpfAANkd
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  8 Dec 2023 23:23:59 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 514F283F58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Dec 2023 23:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514F283F58
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77d85cf1ff5so132189485a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 08 Dec 2023 15:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702077838; x=1702682638; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swkDbVbtiZsl7qx5eTQpBbuEmX68qUc5TQ0Q8dkO5JU=;
        b=fIzIRMDJA3+IbNEIV3hldLbKMSSix9Qakf+L+eutRq8PnMx3U3nlotpYxhGTnCfd5F
         3aSumm4KqCt7MuR0O0LYPHgPgEvFbJ3qNsAZQK/TwHRYeMVcrZoXPCzwDzXx6B66mfqE
         2J5f0HHCM5Yhk1KrNdhAJQ5VOVQOlhZWo3BmHp/Na0BJq3OvgYdKCGQ2mkYVsOlWKjxj
         VpAf99wOoqTq9qMJ/cWNdhS3BD7io0TY3Igfpo0fvlwK4FgHgFhZrlwd93ZgkJYCewqQ
         1yY8/4e9ijD9R5V31GBAQ4fJYs5/glWTsGD/eJUcp7nrJhmb93M9ql/ZDlVJD2ZRoR5K
         +EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702077838; x=1702682638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swkDbVbtiZsl7qx5eTQpBbuEmX68qUc5TQ0Q8dkO5JU=;
        b=jP3tgRA2Y3IRhCq0VZMLHw1L9k9ZYQT22c3KSH2XCRkwSYuyXe+jS4eTKX+1aJF8Wz
         W+bfop9O+uDuoDYt0pSfjoIdDO09Wrs+DOm5cpPKYkInZOqUGDQ5VEIxhrIjsSxK9JJh
         puunL+urjHdCdVYnQG6qk9eGXPUHp/GjS5l5cef6Bz+cKHAtvbkptyvmWAuxJfncL6ct
         brn50lyneFc1N0M0mAcCCAD2FvdfdrBoa6HX+th4b6fSd+Yny0cCywus46tzLlSxRNgT
         YHEGYhD0KDpY7su35qrX0y38wPql7E8dDKbkf4a7IwMn0bOQXpr995TzYRREZI6DEEx3
         c5mw==
X-Gm-Message-State: AOJu0Yzpb6/ly3SDabYRQn5uoThNXHfC9xViivnMHSIRltLfgHztruf4
	coQ4LjhNLt8cjSOQnXX56XQ=
X-Google-Smtp-Source: AGHT+IEEEr17nF2+zSrKK/DQoTdshQqAJTHKRbxaUJ/63jDbhIQS4HEv2bZjp7t/HMwUkEFRuYP47g==
X-Received: by 2002:a05:620a:440b:b0:77e:fba3:a211 with SMTP id v11-20020a05620a440b00b0077efba3a211mr1080699qkp.107.1702077837956;
        Fri, 08 Dec 2023 15:23:57 -0800 (PST)
Received: from google.com ([205.220.129.31])
        by smtp.gmail.com with ESMTPSA id ul10-20020a05620a6d0a00b0077d86528920sm1024400qkn.120.2023.12.08.15.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 15:23:57 -0800 (PST)
Date: Fri, 8 Dec 2023 23:23:35 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
Message-ID: <ZXOlUwNh-JzAl3xO@google.com>
References: <20231208075037.114598-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208075037.114598-1-anshulusr@gmail.com>

On Fri, Dec 08, 2023 at 01:20:35PM +0530, Anshul Dalal wrote:
> Convert device tree binding documentation for GPIO attached mouse to
> json-schema.
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry
