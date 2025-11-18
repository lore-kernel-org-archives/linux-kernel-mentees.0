Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ADB346E59
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 11:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466405; cv=none; b=TVpPAvMMTH08pZbNq/nUtk/vfpI3Gnie2zeKoxSgHEYrlRKfF/Gtr7hxePZgNiaM8XcFwnoiTP9tmd/js30ghkku2cL5QIG93cnGqCXmCJPQBCxIDWMNamx6q3N0ruu6b0sr4TmtKVKJAUt83NW4/ymecaQHi4yX16kNXpaiJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466405; c=relaxed/simple;
	bh=3tdQzlCbe0Y1DhaDg1LZSbowfoTXLvkluyB2GTOUvI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIRLiy/FMo5GyhAFIf17y9BoVvnx1JS0K5jwaryR20HFAkFmL+2HQ2E6YPFIx/fi5oRvHL/nuCdu1J8Asw+jIOW2DWHbhjmBy5nlL08/S1TDuExr/hd6Ozcv9oTnxVETFeyC1rVNp2Ybhdq/Ed4oMsrdAGuYs4o3N3PdXmS4IdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WH0w9LnT; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WH0w9LnT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03046407FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 11:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVy1fsDppuKR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 11:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2FFA407F8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FFA407F8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WH0w9LnT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2FFA407F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763466401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G50nyUS6RKtYR6MLsNJYK4QZ6bz7S7uMs82ckDdodyw=;
	b=WH0w9LnT2nFmIyUIE3lYQ7KHRzK75RrITspaM1K3/63hLIylTpnnciyda3Zo9R4U//zerB
	khF2cE+sWoOKsN5SeNV+X4D2LsP7r9O9AGkL3cBLBoxHg1+UQtI0xnUQ1WFmoR5OvAT0JM
	BrmtwIwcCSsbA28w6tKs3muZExmPZ/c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-9zNQj0M7PUy-MnZFaOJMxg-1; Tue, 18 Nov 2025 06:46:40 -0500
X-MC-Unique: 9zNQj0M7PUy-MnZFaOJMxg-1
X-Mimecast-MFC-AGG-ID: 9zNQj0M7PUy-MnZFaOJMxg_1763466399
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42b478551a6so618516f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 03:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466399; x=1764071199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G50nyUS6RKtYR6MLsNJYK4QZ6bz7S7uMs82ckDdodyw=;
        b=IE++jskkH3ryly2ArvlaTr4AAcYoKsfa9kdE7QxH6Zs/DBle/BCi1cpH5G0wTcXI5J
         XAVT3eBZQgQOgX1qxjMLmInD03SYXLUpsJhX1vU8IPn1WejNCiLKT10rG+UX7xF0UC2m
         9B9BiHTZZRberVwSbZ3f2OyTxNjzCAOx0JwI5BfZbfK5ktUn/GvV23HzjsGeHFDprC4z
         yvTuyjFk+7kuMKCX1Q7qa5BJh/zGNwfyWgSfrGsNFN0YVR/gGhvQz5n6wmB6GCADP16b
         ncBPoQ+WxhrV+xhTLa0iPZqsA5My7gevTpeeM5CcI0KrIWhqTUO4wy7QGfZiooKhN/T3
         LnBw==
X-Forwarded-Encrypted: i=1; AJvYcCUtRlVW5ythL84TUrwKuNuNn9sD1td40zGRrMnKeTIBsBPMRpq2SqFRs3w44YpHrd2Dj6xzG+5wSvC7gSMk0rAfIXfw+A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxXc1ejwJJ8Aiy6+qZthr+tc0GZwKgReTmvwDn01N9hZ/8nhpAG
	0AsoB5geyIsQB91vJYiZ0UO2Ek8B9WY4w69MHF5ENKKrEx5sqV0XKcTtH69gE5fk4uv7vllSwDm
	ZDqdqrzVoTsQn1NNwgRFIXrHhtMA8OXpQJv04fcE6gd9aDo71JHO5pwmoXinld5gIsocszwfQst
	CtnYIiF1RlMm/WbQ==
X-Gm-Gg: ASbGncthZHlS7eH0wm22CjZqjseDD04f8Qdkh+QW3aL2ObV6XEm0POk1zbidO6MkEkQ
	5Ww2TFmL6TlmGJZUY8bzzOMNX1Xo6SGk9XLprLbwJgVkJdihzWsLc24ysqG6qiPEFOt9CrG+OHT
	QaAohfQ6uN2degJ2h8qdN0NeqmULDMsaXtQjyZ/KQcFZ1GXSu0o0dM8lGyCDmtAevbiP58OjzPM
	yB22yAt7I4KzWdny8ugumWMTVrEnQCntSmZ7Glf0k8wWBHVLlPhHeuLsolG7DdrRZ+y2L9+BXPs
	Y+ueu6NOYOM9OjLmDfckRY5o7+nUczuMAkLnW2ZlMuBbzeimH6F1uWP2YIxmMm8q7e/QhoxmcS8
	nwhgkKZAq/df9
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr129228425e9.36.1763466398700;
        Tue, 18 Nov 2025 03:46:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuf9QXTTEdA8gMcfFBDPoA6vL2L3+p/2KXiQoIKGU1o5Q+h8ztlweTgXipAxyEIVY8MRihPg==
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr129228085e9.36.1763466398265;
        Tue, 18 Nov 2025 03:46:38 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779525d2bcsm216280495e9.5.2025.11.18.03.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:46:37 -0800 (PST)
Message-ID: <c6fa0160-aac6-4fc4-b252-7151a0cb91d3@redhat.com>
Date: Tue, 18 Nov 2025 12:46:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] team: Move team device type change at the end of
 team_port_add
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jiri@resnulli.us,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
References: <20251112003444.2465-1-zlatistiv@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251112003444.2465-1-zlatistiv@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K5p_9KFMEgicfGp9KIaoMU3RGTZ0TPM-FMfREEV-0iw_1763466399
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/25 1:34 AM, Nikola Z. Ivanov wrote:
> @@ -1233,6 +1231,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>  		}
>  	}
>  
> +	err = team_dev_type_check_change(dev, port_dev);
> +	if (err)
> +		goto err_set_dev_type;

Please don't add unneeded new labels, instead reuse the exiting
`err_set_slave_promisc`.

Thanks,

Paolo

