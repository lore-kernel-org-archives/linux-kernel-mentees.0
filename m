Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434645104C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523095; cv=none; b=rj7FaptmbpGIeb1wMJWdeZchKk210uQuz0EPu4A+hzDJVz6whFMlieCzZb1F5UUPqDhGEc0Zhy/+on7wR9BWlVR5xtKPSXW28HceoFpaVkfFAbKf2/f2QRx4vVXE16qk1rJ5y8vORT6GEen56dIR65Xt+PiVIgls5yb8jRZ/tI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523095; c=relaxed/simple;
	bh=0qmNpaBaB2RvZIzoN2H2Ll7z3IaWWdWskW1cUsIq6nY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dyFyYZx5hOhBuz05sLN1SxdR6u6iN1rcgNZeveSqUk6QavF1Yk5+9RjB0Mffoi7TkAKbsXbofo0qLchtdCl1G2ja0DjLjqJ5A5JKyBqekPchs4AnZiFDqFyMm8T38E6PDP5g7g02QJec4ojmaAZE/YTnTu6JU5awGqkp7pRq/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5jeHgDk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5jeHgDk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so2048076a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523092; x=1786127892; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Cuo1/buJDSgVaRnV7IziqM+qa03lBm77pdDeWz/JLcA=;
        b=G5jeHgDkGT5VLG2Kpqs3Pk/0NX+fvQElMjs3bs4Kg8g/ayVke9+qpwLfzOMZuGOgu+
         EMaQ9vWUqKH8zqpE8praUDmprVOox82uZpHIvqt+zGdxUpJFm31IY1axCT98Qs9FOAna
         LWKWVW307eBDJeVU7BJt8ZocTHKnU9jTR7E882jorveQsyKvYVgD9KX3Qn6VbcY2tQnf
         SrSwRlwQohaGL6JNGLdSIxt0ggFRcyVbGw5ojcQSimDZ7zh4MMvxEODsRR6JoBtUVZ+U
         +xn00sxcxAOaImILBjZhWtvaX7MlbNeSNzL3oo/li704++RRolB0YZCQ0GaKtejvG0Li
         vtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523092; x=1786127892;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cuo1/buJDSgVaRnV7IziqM+qa03lBm77pdDeWz/JLcA=;
        b=R6inEB4a3HJ+UEDGtNCdLTkI7SztvvG9wDWUyF/iM0uosfkwEgwuCbGfAHLVeYKgPf
         IFaKWyd8ruVLEw3P2uSvU9Vra+SjiAxaLX11KLMolplzAhlJyAYZRjq+EvFpQD+mqVWV
         VYmIoGlQEJU0FvfCzS1MPHAWifBuwHUNkhJKAd6eyReKi3kozAebLlVm5qtkUAb1LEla
         FeoeYuvIu8YQsnIZn1vSSL41EQk5R0OjpvVN7eYRjBLZZy1v0QEQwZihTSf/DJg6x0Ww
         Ux0bjUgBevAQ7YkOoZ+bHqUGM8KcQ6OQs6hbHnTHy1afuH51V8XsgBVY2DjUC05GLuuV
         HMSA==
X-Forwarded-Encrypted: i=1; AHgh+RpqxzVT+KiOdKshzKl4VUiji2g4Bvyvd6DkfHNWRph1bmQkOeXxCIvBA2GGnLRItzOiVhfW38O2Xc5tPCLWl7IMfQfxVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDHPDznGvnejSXpFT+1Son3IIvCozDNlfTfbSmPq9L9bSHOHKM
	a7Cz0PlbvYBrXGSAuljXZeu1moaAcjlOuWjV3WzYVNBzJO85wn80nTFEzepjBHw=
X-Gm-Gg: AR+sD13pNcXwiRNHy4ik3jMeLQ2bIF5qOTGo9uW2LSs4Bwfp+z/C4Xvoud6qW95zsSd
	66LmGlrUWmwziUcxp2Ps5kPfV2lOZXlTpEbc4EoWItzaHKK4I6vEuQnnqELiWwYxiIOLp/nLqb0
	Ao50TuofP3DXe6cqIPAWQkbnoRJ35CfaIh1K4kMtwfU0MQa+f8MBSNqz+4dHmN5z8Cqoi0o2NZu
	OKchkfooicCvifQtHY1NBBh2oH9VWVHasFjArDtWkvsL5F/Xb5tNylzrmbcSu1GY9J9880tTw4I
	rr5ljy4ss4buP5dx5Petuak7VnNKkgxYcSkfktI47i27lS1/lDA7NsebWbvwqv/MdSTihMzRDyK
	E+zuRPdZAWMn/jvS1g15mw59jL4+yciivaK/8fqMT5SypKa93ICLjkfzfzvxTn9WQRrIE9yCyBm
	UehTBMRCdjLHKIYeszKsJPKp0qVDErXMiljRH7YpcFbp1S7/4QyYqnv5Ad+mF1Em4qdCd1KgiUL
	TVXUD5974cgty5JWsNG9cXyYAm9uuSfZHVa19sfZetSk9MAQGcCgpdeQbmBukcC1L4WbtrtlglX
	qO47dn5mIcmR5A==
X-Received: by 2002:a05:6402:1cc4:b0:698:821d:aa37 with SMTP id 4fb4d7f45d1cf-6a0a7cd4980mr372451a12.24.1785523091596;
        Fri, 31 Jul 2026 11:38:11 -0700 (PDT)
Received: from ehlo.thunderbird.net (92-242-248-21.broadband.mtnet.hr. [92.242.248.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c655626sm3205982a12.22.2026.07.31.11.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 11:38:10 -0700 (PDT)
Date: Fri, 31 Jul 2026 20:38:08 +0200
From: Jakov Novak <jakovnovak30@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Pedro Falcato <pfalcato@suse.de>
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "\\  Liam R . Howlett \\ " <liam@infradead.org>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_mm/khugepaged=3A_replace_mute?=
 =?US-ASCII?Q?x=5Flock/mutex=5Funlock_usage_with_guard_macro?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260731112541.6098017d442451a8b54345ec@linux-foundation.org>
References: <20260730204724.16912-1-jakovnovak30@gmail.com> <amx5XdMQ7S_krjNA@pedro-suse> <20260731112541.6098017d442451a8b54345ec@linux-foundation.org>
Message-ID: <716E3F29-C75D-4373-A8CE-C2AB2DD7FFEB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable




>> > Reviewed-by: Andrew Morton <akpm@linux-foundation=2Eorg>
>>=20
>> Hmm, did Andrew actually give this R-b tag out? I can't find it on-list=
=2E=20
>
>I don't think so=2E  Hallucination ;)
>
>I do sometimes sneak in an offlist R-b when I'm looking at things but
>I'm pretty inconsistent and lazy about it=2E

I saw the tag on the mm-new git [1] and I wasn't completely sure if it sho=
uld be included in the next patch=2E Sorry about that=2E

As a general rule, offlist tags should never be copied?

[1] https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/akpm/25-new=2Egit/=
tree/patches/mm-khugepaged-replace-mutex_lock-mutex_unlock-usage-with-guard=
-macro=2Epatch
