Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224973081C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586272; cv=none; b=KATmX2NlkAAmn/aYqOCdK4PbEZn3HEkFn3r306vFJwA/mC9iBkCrGckM6F+TQyUtvOfZpQx9RGO7FINBdkO7OANUU0VpTDE2t31Tse+OiFbjSEcqNy3DAofv6dA0Trr10aQrOOtXzHi9sOh0ZIlYjo7tFZWo8pmudTdb5s2ncjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586272; c=relaxed/simple;
	bh=Fqr6qpy2QHYm2GjegQoamThXNI95Ygn9oib3niTm4oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0QKZlUOkf6NLCLPSv7lr7X11I0GoPEDhJUnNbhrXRdicIQW68NKiXkCnsKpkrwKw1W9BaHsbqwflM68NrTmY8CJDPd+TjD0c5ukB5KVAByrMXL8hKmq6o4+UDtVUs+jgYmts+7p2OPA8siIeFkmDiuQ6jJWwiJzRMh3/nIyZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=z8Q4yKik; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="z8Q4yKik"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91CBD40637
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 10:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJxbyYCr430T for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 10:51:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=jiri@resnulli.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78D6A40342
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=resnulli.us
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D6A40342
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=z8Q4yKik
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 78D6A40342
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 10:51:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so40220705e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Dec 2025 02:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1764586261; x=1765191061; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqr6qpy2QHYm2GjegQoamThXNI95Ygn9oib3niTm4oM=;
        b=z8Q4yKikTB8KeRun4ZhFxrleICwbGhg1HnNyXbwmD0s9ZPRSkBrGlI5tQ3ddvt8rA3
         Rif1bvGCRFsoJonkAk18m8Yd8zfw10bXe352GUpU5URMAwBBDTNTt7ll0fcxrBgwLBAc
         MWVHhKVxTAIUkMgnx6lE5KfAmM419cy0IdTW4vHv9HmPRTp9VqJoxu6KzntDYu3vTCqf
         /4EeGRk3TJZsQetM1MCFE6qq7AiNHoVqm/UE9if2uhdPk42hWjQUUyb/+vNT3ehUbibZ
         3zUErKy38fHk50CrjavKgkHRPkgqa7zHQgh50y0ayvMfh5q9nrXRjYzbWeoKf2YJQjH1
         vAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764586261; x=1765191061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqr6qpy2QHYm2GjegQoamThXNI95Ygn9oib3niTm4oM=;
        b=T5zuAN4jwl88PDaAt1AgBfpeehacxpl7HdsKcArh5enh+vi/OixRnkAy16ELuAGJP5
         IGiRK7XX/SOgAqF0pvUX4xugNKCcrYJr4tzj5ZPbiZ8rc1qjv662kKIKlHkj94opq5Gr
         M/K/R3ih7Qs9dc07wyFmts5QyrBMaaHIP9548L+SbAl2wCMicfkcMVSq7VS/HtMI5hCe
         81qeZ4alsIMnx6QHH/eKtly02CitN4pi9OS+qw9q9oIi1b1KKhrzYUAFsaKskciHuCh8
         009SRekic+heypZZMF4SkMOwYinFjWZdThe1HUGVdYA2N4zK3XOQNztO0U+0/NBfrimM
         1U4w==
X-Forwarded-Encrypted: i=1; AJvYcCXTkJqIHFPpIP4ySGTUHUpXewSvazmDTvjxFkIvT1667SjZWycjwAHZ66DMaTJAUhf7SEWc/X6fg8CURXfRkRs2AWpHfw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyUBtJrJnXUyQxVWZJ2NNIyQUVZpRukdPjo7+Af1NIAR6ihd6qd
	bzhY48leo7kp0BKZgMWw04LUw+HnsXxFGiQt8TMwcFLaI+vuso+xlcGMmzXMFAefAQc=
X-Gm-Gg: ASbGncs0LDZSPPotgfSX8GerlIvuORtPTk5lvQLGMHi940i/Hnrt0bKi0sGZL1FgUGH
	cPi0WjYm5i4dE9IiJ/PfkKOX80UrZ4Dyo4RMS4lIFjDkedLfh3+ZDJJ/XQHRzIEw0ftDiz1WAaf
	b+DW/seO81tMOY/nI9gIKxPZE05AxF+L0snwsjfaAYYAZiWMPrhJbT3OoTLEnVhbUW9D72cMNeT
	BKUDlXgzZVeKvHzlw9t17ypXalX9/D3jYUP/XMpyOJyC4BRhv+TgXVgB8u0LVk4uWDIf2qkAJoB
	uqjvozlkltYEWcdN/21i2zd2eU9K+sXC8PiCMaxKDlJUq9lIgTJrqSVTpDZD5zb/kSF5wQTRHXS
	4Ex9BxsE+0qUgH6taEbPrLRgC+4WA5o8/8G895th0ktIvXa415xGlaRFyPKibc9Vxf4w+D8rM2Z
	llWk5NNJFIB3B3zFA5WMdkpt3iH1mPwLjo
X-Google-Smtp-Source: AGHT+IHDMrqX/K8K+NlPhHfHYNqhShQOpD5sAr4CXR4vDEef6ED23rYcb//HGm9GwLyaFTWyCcDhFA==
X-Received: by 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr523856105e9.24.1764586261487;
        Mon, 01 Dec 2025 02:51:01 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791163e3dasm234443755e9.11.2025.12.01.02.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:51:01 -0800 (PST)
Date: Mon, 1 Dec 2025 11:50:59 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next] team: Add matching error label for failed action
Message-ID: <wneutmbnj5ie265wee6lssijddfomagyrkckepjbeexei3nqng@as5icpm5f4km>
References: <20251128072544.223645-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128072544.223645-1-zlatistiv@gmail.com>

Fri, Nov 28, 2025 at 08:25:44AM +0100, zlatistiv@gmail.com wrote:
>Follow the "action" - "err_action" pairing of labels
>found across the source code of team net device.
>
>Currently in team_port_add the err_set_slave_promisc
>label is reused for exiting on error when setting
>allmulti level of the new slave.
>
>Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
