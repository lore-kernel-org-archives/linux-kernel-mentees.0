Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86EB28DB71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763803144; cv=none; b=EMv0YB3Oci6/l0hyGvSOKx+F75ZrUa6EFgAFBVURvVMw9Rm8t5NFWHeAHKC5qBvfiLZwde+BtxOpanNGO2mqiDNfljV1JD+RvUl5hZcNsqwITNXexBTaeKMwb39aMestU20jEmCMLPO4uph/xrK2q4fVlVJBswTlpFp0JuwU1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763803144; c=relaxed/simple;
	bh=3Y6g3pyQ7xItiex/CLdc74fmNKXzVEtgCADpye94/G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHXx055/sGL2/ceJSvOIbzLDl+wOfDuTamzx00H5YZaN8aqLz1Ju83UUMDXVjlHajS3wWVNf8qYwRbRwG2koSDzhg8y9gz9kUogXnmihVyhLKEa+Job9lw3Vo21Sa7IzmBCezKMAm5aruHHjq/60qR/LaTIn/NQRoIV3/+IHOSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=MOO2uRON; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="MOO2uRON"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7D6140167
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 09:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om0zT7K-xweU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Nov 2025 09:18:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=jiri@resnulli.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 428C7400DA
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=resnulli.us
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 428C7400DA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MOO2uRON
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 428C7400DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 09:18:55 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1136785f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Nov 2025 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763803133; x=1764407933; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=53xJV33swqTLqvE9PnvUfsctO42OXLht9ChQmj1HdnU=;
        b=MOO2uRONkboDfLat5IeH1367V+JNHgJXd4Q9SchI3qNn4o50QSMpcu7v1vYftjoGJH
         IA7/D2K7yCGZeRlGz0Gjb+onQS/+sj2qZDux58zHIyS0AEMhfKj6Ivqpt3U2RTI16Y0P
         uCqBq+P8kKoGhcGPPc5VT0Trg7UzreDYoaDz2N0prhnqtkGSXslXJ7jYup2ssGdB3Z9y
         9bxsIKoKvkuIIbmFDeQ3uf0zOklfVnuqhTugaPsvnL64Oz6QWEuDMg6E/ifo4t4KVcRV
         j2dyfp8MjIlxdi74IAuUQxrl9qaBGgM2Ws3vqyJTY5aZ9a/2ibGmrPwFnCb7lA1x8U5U
         yTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763803133; x=1764407933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53xJV33swqTLqvE9PnvUfsctO42OXLht9ChQmj1HdnU=;
        b=Z1EAlBPBr5R1TFeAIaScUyZODfUG97nJOvueGIVFRO7haVnd2Eac/GuIAUGQupyWRc
         t0PqRBgPiU30kCBf2RzuPV7kkZ9cDbn9NiSylKP0GqPaSW3wYznssw4+eX7os/Y34fnH
         7vJVySDT46czpm0YjYe0JlDB6Z/cfLlJvt6G3dzi3Gqcd6q5jTFFp2KLbhnL3BkYFiyN
         8ghOK3e/xRSyj0a2q6vF19Ga9QfuF5fTIqKrOeQ0u0Sz3IetLfYimmshyN0ldiJCeslx
         Ep6LLHCaK7mEQ5DXA/ZbUfbQja+J0oqnHjAM/WRxXbPAPmP144esgCSAo9RFcvQuQXtQ
         lRng==
X-Forwarded-Encrypted: i=1; AJvYcCVP3/a2ly6wzM5Co904RJaJulLTb37EetqBlhTlnfqAtBj94xu7XcthIScL8GQs1kUsHnfJdgrOsmGSY545uLlrHeGZTw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxdO33bsGT04dvHhVMMbjmsgRd9GjWIMuYeVCJLsr45pkm9nlyN
	HZoIiyZ02iDmha8oTr9lcj6KyVrR7/svby9gzF5L7cMg0Hbza71ZvRMrHSJ+r1CFWyA=
X-Gm-Gg: ASbGncvrlucwXOfNhwyu4yRz1JONfedSHlmrtP8apadma/ERY+ryFyViikEn4i6DPAR
	0IXL2ojQCVToiYaiJEPh4YgHzCf3QI8upGrTaG8qEFgSNqMjQm0SbuNjaZYEuc7nuMZq2GnLMQf
	SAF/a71T/IipoXtt9l4vTDRYAK25VU9WcMJzsVNI5+hACtvzBeqaaUhc4aE7fXh3uxktaat5rkt
	VyzjJj3xWgNbDlmknDhQacIximon3oEX+FMAUMU8EXx2CugOpjjdhiKZ3n5plzwf1O2io5JHmrp
	fX1IWu7wuCt2vo1KtSwnBbxtsGgV/nxRDT8Ntl7Y4CODLyP3quKVDdb07BdcnBT2c6aMpLPviiw
	YSWaep+oB0zcP2i7QOs2L68LeGHljxn59YKE3Gxwu7/PaHfAeM68sfYzDomIIBGh+7GusuLfly/
	HmFGA8iwEgKOEZ1fVX2BoU+06uZ8Bdz1w=
X-Google-Smtp-Source: AGHT+IGhv/ltDYbUC0qVNfi4WFC7UzIuD90H79TWw0dTFe8qWwKov+G9K1DtiG1LYn9cp3AujCyZqw==
X-Received: by 2002:a05:6000:4012:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42cc1d1999dmr5618342f8f.40.1763803133010;
        Sat, 22 Nov 2025 01:18:53 -0800 (PST)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:7d8c:1d72:b43a:e19a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm16607741f8f.10.2025.11.22.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 01:18:52 -0800 (PST)
Date: Sat, 22 Nov 2025 10:18:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
Subject: Re: [PATCH net v4] team: Move team device type change at the end of
 team_port_add
Message-ID: <6wrz2ldfbfhzolevx5246he3hekgevqmhxwt65hbmvyijkzayq@yadj4nwt2yvi>
References: <20251122002027.695151-1-zlatistiv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122002027.695151-1-zlatistiv@gmail.com>

Sat, Nov 22, 2025 at 01:20:27AM +0100, zlatistiv@gmail.com wrote:
>Attempting to add a port device that is already up will expectedly fail,
>but not before modifying the team device header_ops.
>
>In the case of the syzbot reproducer the gre0 device is
>already in state UP when it attempts to add it as a
>port device of team0, this fails but before that
>header_ops->create of team0 is changed from eth_header to ipgre_header
>in the call to team_dev_type_check_change.
>
>Later when we end up in ipgre_header() struct ip_tunnel* points to nonsense
>as the private data of the device still holds a struct team.
>
>Example sequence of iproute2 commands to reproduce the hang/BUG():
>ip link add dev team0 type team
>ip link add dev gre0 type gre
>ip link set dev gre0 up
>ip link set dev gre0 master team0
>ip link set dev team0 up
>ping -I team0 1.1.1.1
>
>Move team_dev_type_check_change down where all other checks have passed
>as it changes the dev type with no way to restore it in case
>one of the checks that follow it fail.
>
>Also make sure to preserve the origial mtu assignment:
>  - If port_dev is not the same type as dev, dev takes mtu from port_dev
>  - If port_dev is the same type as dev, port_dev takes mtu from dev
>
>This is done by adding a conditional before the call to dev_set_mtu
>to prevent it from assigning port_dev->mtu = dev->mtu and instead
>letting team_dev_type_check_change assign dev->mtu = port_dev->mtu.
>The conditional is needed because the patch moves the call to
>team_dev_type_check_change past dev_set_mtu.
>
>Testing:
>  - team device driver in-tree selftests
>  - Add/remove various devices as slaves of team device
>  - syzbot
>
>Reported-by: syzbot+a2a3b519de727b0f7903@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=a2a3b519de727b0f7903
>Fixes: 1d76efe1577b ("team: add support for non-ethernet devices")
>Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
