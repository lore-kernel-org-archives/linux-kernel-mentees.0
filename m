Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616B66FD9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OILa95dz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6EA42854
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6EA42854
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OILa95dz
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEcdmIkopWSC
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 07:24:42 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B9DD242853
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9DD242853
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3d0faf262so20302155ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 23:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703316282; x=1703921082; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jORh9fw7nr/hSfxeUA6D1R76ciFhMQw7mZ7t5scr0gE=;
        b=OILa95dzOIdpyFWEplX5tDRaQz78HA5H9XirLDiws2Sfd0kdJPG5WoKO+4TAWjpR4H
         a+Jg6iaZSPqEN3PFuOJ9Bk/imuJxpFlHlPVUdXkGIbo+RNPBd0XDtf12zb5MrMk5nHHX
         eOz1DsnK9Ae5FhzbHgMVWNYUnW6i4bTQyw7brvk5GtpU3bMkYrAWh29Ttpu8LiP8F+8T
         +dmGssZfopYALuQUCjaH7XuBO8ph9XN4cda8fU3y7u2lTAbe46kYn0oa1tNHz1rg5shw
         SuaBwDsu7cdIe9PdXnX1ZzS7Smlhe9ygMgy6GviLIkVnk/0t/VJsrg0hRzBgSQQ5YdNX
         J7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703316282; x=1703921082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jORh9fw7nr/hSfxeUA6D1R76ciFhMQw7mZ7t5scr0gE=;
        b=WkXVD3ITGp3qShB7AurEN+StC8WKoOXcCKpBSXJHjwHpvAhHUhleg3ErZVsX7DgOon
         v3RUhm40z8eiqzSYysagP14V+aqp/XroJro9hRsFMKd1R8KrdyytNCNiOAm+ZtY6Q+BK
         J/3Tc+WNNQVSs+sb/h04xSQmd+mzjoc340fEgDYHweDv7p3RYch0jDExCmk0Nw3AymfV
         g8Z9lLCfss5cGNkGkgU5Q1WxmeWDDZFHXSiE32AtFYi4E0QvuJWPzNvmXtw5kNv2CMWr
         aCsPON39KdaGuXIpF6cM9TnRdyLA4Nt17yvmifHUZk63uFZDwvdunrTAntbQpldTbjz5
         fwKA==
X-Gm-Message-State: AOJu0YwpabmWUwMRAJJHC+2lX07g1FrRXHH9CuV1jEWrWx78AjjO7tZZ
	Y29iGpz9q9hhheOtmzISNAY=
X-Google-Smtp-Source: AGHT+IHDROTw+qUqQ5s2W41ci3hSL+ozkJgbTmX4v4D4Q+t8ankXeHjijUG90Hp1ejTPeq/3YR7fqg==
X-Received: by 2002:a17:902:e88f:b0:1c9:c6f4:e0c3 with SMTP id w15-20020a170902e88f00b001c9c6f4e0c3mr3346030plg.62.1703316281854;
        Fri, 22 Dec 2023 23:24:41 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6810:f806:ab04:8efd])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902dad100b001d3f42edb4dsm4483746plx.294.2023.12.22.23.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:24:41 -0800 (PST)
Date: Fri, 22 Dec 2023 23:24:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v1] dt-bindings: input: convert drv266x to json-schema
Message-ID: <ZYaLNkYRt_WHzvCD@google.com>
References: <20231221183109.684325-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221183109.684325-1-anshulusr@gmail.com>

On Fri, Dec 22, 2023 at 12:01:08AM +0530, Anshul Dalal wrote:
> Convert devicetree binding documentation for ti drv2665 and drv2667
> haptics driver to json-schema. The previously two separate bindings have
> been merged into a single drv266x.yaml.
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

Applied, thank you.

-- 
Dmitry
