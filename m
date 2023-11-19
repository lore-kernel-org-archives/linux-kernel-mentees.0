Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F061811705
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A95340150
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 13:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A95340150
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.151
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0u_KVjxkuZEe
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 19 Nov 2023 13:49:43 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7287240119
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 13:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7287240119
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b565e35fedso2326402b6e.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 05:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700401782; x=1701006582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea1nL2nPexAtRKPgqXuGpzPO5QHlIHi+M6o+KnmRKRU=;
        b=vQBOeS22bhiu6dv0ZCHBMod1XRQEApneKnQ3YzSfVAQVArAzsSYh1EDX4K3bLQcnrr
         w1hm7wf7i2qjyOm8EDj66z1SIzEC2ubMxTOEo2aOtBTmDj+wNSXjbJkulClgljwp6tIc
         XBZh4FlUDWHKQdNtWP94zgb+NmBtScXWQFI+yHfCApXfcaqrWuFETh6AqukyOwYjZUSx
         1w19Efm0PsEd4np4h+kw8XN+guK2lCWHggmEL2MfQXtZPfZpQa5fyfmS56aOSsAKS4i2
         Df7MvgLXWAMUx5mudRI6P05s4MLbiY4ihFdWqa/mWxTmEtEjEzwZ3wKFrgTERN5yDFOY
         /7ng==
X-Gm-Message-State: AOJu0YyWB27p60heD0dVyIbrYOLopYYNn9ndkXv+trAL5beTBJd4WQr2
	osgAp3XKoqsSztt27JpyuQ==
X-Google-Smtp-Source: AGHT+IGxVkAxDv26Ud8aWhrf5vJNXccASuADchAxq+oMG+km9HHX6JHB8u48ZRVIHJQaYC1FS1BOuw==
X-Received: by 2002:aca:1005:0:b0:3b3:e64e:e0a4 with SMTP id 5-20020aca1005000000b003b3e64ee0a4mr6236212oiq.54.1700401782352;
        Sun, 19 Nov 2023 05:49:42 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id z21-20020a544595000000b003a9ba396d62sm968588oib.36.2023.11.19.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 05:49:41 -0800 (PST)
Received: (nullmailer pid 9867 invoked by uid 1000);
	Sun, 19 Nov 2023 13:49:39 -0000
Date: Sun, 19 Nov 2023 07:49:39 -0600
From: Rob Herring <robh@kernel.org>
To: Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel-mentees@lists.linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
Message-ID: <20231119134939.GA8784-robh@kernel.org>
References: <20231117164232.8474-1-petre.rodan@subdimension.ro>
 <20231117192305.17612-1-petre.rodan@subdimension.ro>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117192305.17612-1-petre.rodan@subdimension.ro>

On Fri, Nov 17, 2023 at 09:22:57PM +0200, Petre Rodan wrote:
> Adds binding for digital Honeywell TruStability HSC and SSC series pressure 
> and temperature sensors.
> 
> Datasheet:
>  [HSC] https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/pressure-sensors/board-mount-pressure-sensors/trustability-hsc-series/documents/sps-siot-trustability-hsc-series-high-accuracy-board-mount-pressure-sensors-50099148-a-en-ciid-151133.pdf
>  [SSC] https://prod-edam.honeywell.com/content/dam/honeywell-edam/sps/siot/en-us/products/sensors/pressure-sensors/board-mount-pressure-sensors/trustability-ssc-series/documents/sps-siot-trustability-ssc-series-standard-accuracy-board-mount-pressure-sensors-50099533-a-en-ciid-151134.pdf
> 
> Signed-off-by: Petre Rodan <petre.rodan@subdimension.ro>
> ---
> 
> Changes for v2:
> - Removed redundant quotations reported by robh's bot
> - Fixed yamllint warnings
> 
> I'm failing to run 'make DT_CHECKER_FLAGS=-m dt_binding_check' due to
> python errors and exceptions

What exceptions?

