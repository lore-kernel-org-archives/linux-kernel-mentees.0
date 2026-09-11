Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386C449EA6
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Sep 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125334; cv=none; b=j9P0bdyO3Yz+xoQ2MJUkKoRbd6UlCZWSuHciyddqN4cP2ta99xhdug0maZFJNbVMKJEiqVmunWVsv/0s1h1r3iQWasmPPb9Gsj+ndXnu4sXiUSUAyDO2tHooSmTQnUhuYt/DxMkyoSZ1wfZyIY6pK3D68GwyyBdSHa1NKgJzQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125334; c=relaxed/simple;
	bh=Iz+Cr6Z0loakD/erjIMAsYt7hdgC2FopSJGK1uDAkvY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kQpfOeWnuDWGy/+quX36P4S+ek93B7zg6DZ3aWJ/BNimiUVRRPGQjG4GcLeTse2wLh/JCip+tSF+iKjh4Ysll4FyLVEQJq6IFE9KyDll1ZA1NI2Q6WABk2SEQgmGRj45KFvVKH5/6jfbMB+Yg42JIO1znTUMQIx1NHOXAunRsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBYaXum9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBYaXum9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso5917355e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Sep 2026 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125323; x=1789730123; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iz+Cr6Z0loakD/erjIMAsYt7hdgC2FopSJGK1uDAkvY=;
        b=dBYaXum9gZsYvHIVw+PKa7Lfe/LwRW6bSM5f8ohojTmNvLZ/fOawa+HwNNt8KH4pHQ
         D1ym6q1Eqo0ir6kze12jmYcoesYb08yq+SeYtCKrXhpf/d9CdfxrGnSmDcBSUW3147Gn
         HR2adYlq5SE4cZO5VVH73D9BtIPsiOdXUXKDO48eSD7TLM+xS6xwLy5qO+dNxFs0WY6c
         5MKCBbEpdvJsIvZgeevQIxMCedeAq708901ZD0DlYIQ25W83OT9I7IrO4ik9f5jUbWpr
         V/fqDtFn6FYBF1GWMR1ndvFh9Z8LQgPifsLuOS/BUnhG6m9D/gNj7np0UudujvSyylNS
         tmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125323; x=1789730123;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iz+Cr6Z0loakD/erjIMAsYt7hdgC2FopSJGK1uDAkvY=;
        b=Pg534fnpZMCqL6Qzo4rBh/vVMnyUxaVN5moUEQIt29cUV7Dr/y2eJnIknNXzrN0w5H
         Vcx2JfT3uRHpr0xj90LFnOVbloa7IEFwx5xcUdurvXH9/1La/vn2GfzBK10xCPT19lr1
         GggkyG/wPZqfq0d5cJ8Eivw9/jBGXi0G8szU3QKkAPWhhoCQeIRSqcZBB334zpHQHqW2
         0Ng/4I1QN3lBXMRwvW+ryFT2Qm0f9LGCiCWS3y8Soobteh5nzNbxmpAfX57oi1ddFmaU
         dDhlcLmdbnMRZNniDDdwfC7zFQKmlg2NmXukEJviyCdS9SbS/VlYtunWH/8aGFVx5SvG
         J2Rw==
X-Forwarded-Encrypted: i=1; AKwUvByYwvnZoO5/RmzaWDuELYa8oJMkraOaSPeGsuAtGiGkN5orH1ZMSV04of0S7ee/vy0uXqBw/tiEVV1CobNNLMfbsjY53g==@lists.linux.dev
X-Gm-Message-State: AFuF++luMvGwrsKzgqnzT9pFeJjrhYGMzybaRPe29OSVnt1CFiBWhtDQ
	uwAkQcKM6yCZv+k84MR+9GZulCRIrISp3e0BMIGH+JhORih4YL/zP6Y=
X-Gm-Gg: AYBFou3cNyOVNzSsGI26CwcYb/FqzDqpSvTn4vVJUb0UyskImT3VukRA4I77SqKmmrc
	uzZg6K4jwxJ934vFPMF5q4oY6ZCm8laP2umhiqPE/VzQdxyVhDQPUMqhVuHJAVTrnidedV6+/Iv
	TBdzBlGDtWUam9r4bB7bN6R0rJOjw9joCoz95qkjviO50+CV/XV8y0AeyxmvMnSUbbiEsr0NYGI
	meCOJWjqn9GuP6d3apnqUmJ9PrrE8yGGVKQmO5hopLKVm9vCCBtVqs0srEGNAsH3M0DcD+iih03
	4eYNU8xni2YJ5QPGasRtctbc4Lug5AVh38G3bqqTCbLo+e4QNl3Ht67+R64iygvgs+k1PxihrDa
	aUxBUJ/EXu7Zh278QHAf9wKiJ9WSUM6x+JDuOk2MHeq0sZ39CYMR6k7RvYEG8GzULEKnOh5M7nq
	IPOkVVpOgrUongtOkRCX6yhEWLnUuQCxOPUJW9yQH8ZKacyolURFK8wGJbIyC8SDz/bpvkFFVNj
	J/hJVHkBviaiwT0J8JaN2ATCxJFp20QhIb659NqLkTaNFWU+fi5Iwr5eP37HYEyG88/IjCjTgmS
	HNFE4B4oKova1HVbhwZ4cXNQPqqaZRjBo9uRwCRmJ2iX387Wg7UtEytZ1vyzJaAbPQ/2AgO2
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr78139215e9.6.1789125322522;
        Fri, 11 Sep 2026 04:15:22 -0700 (PDT)
Received: from localhost (92-242-249-81.broadband.mtnet.hr. [92.242.249.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm5062381f8f.4.2026.09.11.04.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 13:14:20 +0200
Message-Id: <DLCFZ1Z5FV92.3JAXNVQWJZGN8@gmail.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Ulf Hansson"
 <ulfh@kernel.org>, "Jakov Novak" <jakovnovak30@gmail.com>,
 <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Guangshuo Li"
 <lgs201920130244@gmail.com>, "Runyu Xiao" <runyu.xiao@seu.edu.cn>, "Shuah
 Khan" <skhan@linuxfoundation.org>,
 <syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
From: "Jakov Novak" <jakovnovak30@gmail.com>
To: "Johan Hovold" <johan@kernel.org>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816153809.7067-1-jakovnovak30@gmail.com>
 <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
 <ap7CaVj82BJZgjf6@hovoldconsulting.com>
 <CAMuHMdX6JfqpLMGDQJSQ8E8XNobRwr16LOzuphPt3Afs-OZdJA@mail.gmail.com>
 <aqEDb0THnCM-Q_Vy@hovoldconsulting.com> <aqGWWhvL5CKH2mgx@shikoro>
 <aqOoBwBav8JZhMQ9@hovoldconsulting.com>
In-Reply-To: <aqOoBwBav8JZhMQ9@hovoldconsulting.com>

Hi Johan,

> Thanks for taking a look. I guess we should fix this inconsistency in
> MMC core eventually, but that the vub300 needs to be reworked to handle
> this quirk in the mean time.

Should I send a v2 based on my first patch with the Reported-by,
Tested-by and Fixes tags fixed or is there something else I missed?=20

Best,
Jakov
