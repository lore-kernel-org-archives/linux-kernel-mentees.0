Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F882512C4
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Apr 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748305; cv=none; b=jLCwPXAQCAXf6hZ7IjIyGNgjXKlvUeh+zN2NFpkdIcuJErM90tk3PurYS/1fx4oDwhXwLlR4qICIvS7o+070/pRt42ALzE+gYr0qrV3oj0TtHgW+NKP3CCQObDH1qprBspiC51ZmnprXbxc8qhHkV5yYbtiIm5tBkqOiicu592w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748305; c=relaxed/simple;
	bh=HUCgCm5eBLHBStR2O91yMADuZKW/BMOxTb52gGuSDa0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V7ctYfixT37IZ4B3KMrtiIghHH3mEkwriklorC3hA2XrH1aqr/00enyUq0m1dBOorVRRxmDuaPNkFkydUpNR3VxUJofSt1cSXa26iNl4eYUIIAhGApDt8SNIgF7Ul/AtNtxv6fxoEGmgRkdI4xFImT9IDGt9TViLoA4JvnoiOoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKIT97iQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKIT97iQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22548a28d0cso86792765ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 15 Apr 2025 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744748303; x=1745353103; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HUCgCm5eBLHBStR2O91yMADuZKW/BMOxTb52gGuSDa0=;
        b=PKIT97iQfhhfBkyiJ9QXo6j2lPsHUFHaMhHdgZ584TQl/kS5bxkBTQePqLxVsH/iPn
         9p4K0bNy4PustJZUZSlg9vWEAADt8RbCtqBcPHJlVAzdOqqfP0Yi5JLZAVJ39UVlX+LO
         DJhCDzFc7Z4gJKrKLCltLm3ksRvIwurLWwN/SSNiTIp0lI/iHFFVwH9N4/Nf/Wk+Gj/m
         ugFTZRSCdjrOuvv4ypf7eiNBE7tiT5iFtz6BPeC/hjHDdjuXcv151PQqgFmPIbuSgexh
         EiFoBKyq0vtfG2Rm9MrWJyaB5KsU1PvXv3uDiQuxjLCOJm5fcI58opbcUklFDovTu56w
         0C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744748303; x=1745353103;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUCgCm5eBLHBStR2O91yMADuZKW/BMOxTb52gGuSDa0=;
        b=V3bK7Mor8LGAq5mOTsgBkQ0I+ajMXvo//jqgzoeBHHtQ75g1gl5K7B2syLmPEmMpcI
         6NiTnxFBHn+S1lyRBjTMfffftz4RR2l/5xfX7KHasjTUvGW9l/Ke8qJK10hBOdwI3426
         sfpjMaI+Ra9mnh2toqEdTzTf4a+VvgnjfCHfFRkBbGzDoRk4nlEjYRVB0ygwL1JZWK36
         fcINWUhv3z6jXt5VXdurtucmZhuHgsZgO3CC96l+zftjmBg1qIng6K5jgrpDJ4aDcuLt
         WJjl90PFQvi0WAwQWqiolvFrG71AyF2ZJ9yGnpFxm7Ulaxxv0Vk5DikkQqrvO+eJx+Rv
         zbcg==
X-Forwarded-Encrypted: i=1; AJvYcCUem7EnbLCA3zuzUEyiZF8e4Oco6oXo12IF4gTard8s/fk1aRDlQR3C0xm0actyLUFATD6/qXLYMIy4uVNWHmHlo0NPmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPdXXy7zmNUrQmBjzcixFFdhYyjFaUaUKFL7X5p7oqxjRyB+N4
	1PDZbBuNkC8eRhK9KBPRHypoh2pcPeB504Te+8L/JEv3N6rWAVtq
X-Gm-Gg: ASbGncsDtRdtKAeZ7ZAXUJw8iU6P3pFRCw0eO3S1FKVWHvjf1hj8vaWrwqRCzKvl5Vf
	G+nZzWnyKhE4n9g0o1HsC4I4wCHou5UoA7n88rGDT87mIi7XGg8Q6XO399/xlvtxuMZvU3S4ECe
	oBWuJ+JKciWJBkoPYbmant6WSt8Lzl7nzzJ6OJJmxhG0bxVOUyVwZySKWbYtoGMtPAdw3x6GNkW
	U6nu81A/M9D1POBPROL85RVmznp64IAHDAFHPTR+ymMlusgh83n1rcXwfIzZzKTThjC4yQ0WChw
	R8ZMMRaExFf189w2wXqJFpNuhLTmU+yHztd/7DTGJ5DibJQ5OkE=
X-Google-Smtp-Source: AGHT+IH/ytHBXGU5OM/n668fjd1qsrWG9AAAgNczpgx3aah4xfC2RHe6JCsWXKntuyYTDtniSeWVWA==
X-Received: by 2002:a17:903:bd0:b0:224:192a:9154 with SMTP id d9443c01a7336-22c319f6538mr5544235ad.26.1744748303103;
        Tue, 15 Apr 2025 13:18:23 -0700 (PDT)
Received: from [192.168.68.119] ([49.207.215.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c5e8dsm9219018b3a.59.2025.04.15.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:18:22 -0700 (PDT)
Message-ID: <672c16c5896fb2ce73c9fab62853230164b99629.camel@gmail.com>
Subject: Re: [PATCH 5.15.y] jfs: define xtree root and page independently
From: Aditya Dutt <duttaditya18@gmail.com>
To: stable@vger.kernel.org
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>, Dave Kleikamp
 <shaggy@kernel.org>,  linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, 
 jfs-discussion@lists.sourceforge.net, skhan@linuxfoundation.org, Manas
 Ghandat <ghandatmanas@gmail.com>
Date: Wed, 16 Apr 2025 01:48:18 +0530
In-Reply-To: <20250415180939.397586-1-duttaditya18@gmail.com>
References: <20250415180939.397586-1-duttaditya18@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

syzbot checked the patch against 5.15.y and confirmed that the
reproducer did not trigger any issues. check here:
https://lore.kernel.org/lkml/67fea0bf.050a0220.186b78.0006.GAE@google.com/
