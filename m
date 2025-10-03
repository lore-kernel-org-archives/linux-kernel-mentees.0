Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB032DAFB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513188; cv=none; b=WVEkuua4qV+eVs7NQuHCwjUyGtbrd7oE/1FVz5OVTTcOzWnn0k7gaBeICZwB9xYMn60lMQStFU20hcWDGwa6JdtYel+6TsCSNIo0fIxiHEhKXeY40KTT79FaWklSFmzw9cDnC9t0mMO/uPyjvnJoowLkAw4Vzg2r/ReEMiwWD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513188; c=relaxed/simple;
	bh=rkmZOyEGwokVeWZxBu8CGNqvK5sClSggQ4njXh3MKtk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fh+/yhL8kwAfQ3P2Jm8KTTS7Ae+2lbwcGtMbNYG8Ljnf4aUV/uhDpQjrFC1PntK2btFMDL8BkNJIVpf7b55bQ0slhYziYw8IW8oSIJobezolXmLPF5K4i4RTopERMEPU1g/bmSu9vHPVZERXUnGjOZdlxPHH9ruQRuw1mHLFkPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6A5RsqI; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6A5RsqI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF7A402E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 17:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsERwlj_qtNt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 17:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=karanja99erick@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A904840336
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A904840336
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L6A5RsqI
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A904840336
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 17:39:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so2237495f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 10:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513184; x=1760117984; darn=lists.linuxfoundation.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rkmZOyEGwokVeWZxBu8CGNqvK5sClSggQ4njXh3MKtk=;
        b=L6A5RsqIJv66HTwyeEjcUJtQZJ4K/H8hhv69h9d2Ra87asT3E0r8XyeVlTQ7s7wvxr
         O907Ldd7miImleLaHepGaBLCZ15AoiqRImqcpS72vttN5Zp/XGl9+LoERVCNUbo3JNHD
         fENYFxiMUQ4ehFStMjjh4nUL8fAdqD5beRx3dqg9kFUqV1scBjRW1sHy75rYR5/dyekT
         wdIP/hjwDvUVFcNKIlpjGw/p/B7xpm0tC0CLcKIAdCtd3APRhIFXjquIMm232wNY9YpX
         pPDFdPrxVwf+QyP++XVbUBwQxwctgE/EYYBCG7ofpRj2d7Pl67ca3RHwfiylycG830tl
         Xj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513184; x=1760117984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkmZOyEGwokVeWZxBu8CGNqvK5sClSggQ4njXh3MKtk=;
        b=cdeTw3bCcwZI6tHyztC2GqxKVq+tGmGReznJJzJr36uuImpZuIrWK0CpBb6F7ikR03
         G4JfPL8Ias79tHtris8+C489OuXkpAf1VhwQunPy6SjsS820gwTuLq5nAALQ0Iva8Bm8
         n7EjWSjIC0CZ/JXHscJALbyvgb70/lEKfkxDa6vDzqj225Eo3q2CV2f9daKVY3qKfNID
         h6fAbWNEFHuOxOI9kcgFeF3gSgKUFeDudjdYnDtlt4faKPXJWMg7Npn0FnfVkVI7QDIT
         envSNd+WRtggocTsAzbrdPb8PJUzkoqorOYjNBD9u3cLBG3KR0PWEzh+/DaQgNBgs2FO
         0yWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkrSLvuJDl5yq3aHwI1zUiywCk8xz2ev/HL87S6moWT56UDVZv6+HHgBn5qYzvPj3woEdPdf5iSx9XMgO8EVFh3xgP3w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxCQyqrjB8O2Ux4r8KL6dEAtSLFI4A4HjG4S04X8fc7WU3QeRCa
	/EIBL0D+h2ulJ0qXMjetvz8wkOywNP4fe0lJMN9gMWnG7B/iPiG1VHmX
X-Gm-Gg: ASbGncvS3ORHmKsshqfErr0j5r/wzEVrg2DjixeD/O2WeSwsiFhp1ewFE7vP8vPIMNL
	v8MCSTJnn/56WF7YSsKZ6esfjfAJCwDetAIJcB/T3BP/NLeOohF+ZsI7CLs36x4xRnxpuhV+tho
	21Zg5yPK2kFa1aVGudwBExSP04B6yBM7KUlCCa4LahoHCj+zJpUm4OseX9k7m66N5Vzp4n73QVa
	zi4SikcaJwPMngDxshLYe8D+b2lD2UnKJ3XOeveGNpQsawIiYYcAMpweL9jJLea0sK1eFsKieSU
	dEqChT73lqx98FDGBK8gYbF9lq3fF4SDgQ8JZ7qhOVziwuS/PZoEocdAs2weK9Ugk+9IjBKSgPr
	5Jf/BNzs04UPEXyI0cKfBie7d5IIReIt4Gm1v+fkqyBDPjqJC9GX+/zX3QanKxLnWjc0=
X-Google-Smtp-Source: AGHT+IEuSki/XoM4rCKcaotfXJjqysypOd52m6IgtN6NTBsDMyUc4KvPqkIPo5OYOt/kydDekftJNg==
X-Received: by 2002:a5d:588a:0:b0:3f1:2d30:cb5c with SMTP id ffacd0b85a97d-42567154011mr2824129f8f.23.1759513183310;
        Fri, 03 Oct 2025 10:39:43 -0700 (PDT)
Received: from [192.168.100.3] ([105.163.1.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9890sm8871298f8f.32.2025.10.03.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:39:41 -0700 (PDT)
Message-ID: <b109dcf89e3e1314224e5a29706154c2e612e079.camel@gmail.com>
Subject: Re: [PATCH] net: fsl_pq_mdio: Fix device node reference leak in
 fsl_pq_mdio_probe
From: Erick Karanja <karanja99erick@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  David Hunter <david.hunter.linux@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
 <horms@kernel.org>
Date: Fri, 03 Oct 2025 20:39:27 +0300
In-Reply-To: <77f2a45b-1693-4106-8adb-304e0e818d82@web.de>
References: <20251002174617.960521-1-karanja99erick@gmail.com>
	 <77f2a45b-1693-4106-8adb-304e0e818d82@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-10-03 at 18:32 +0200, Markus Elfring wrote:
> > Add missing of_node_put call to release device node tbi obtained
> > via for_each_child_of_node.
>=20
> Will it become helpful to append parentheses to function names?
Yes, it is necessary.
>=20
> Regards,
> Markus

