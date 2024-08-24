Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCBC14B09C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 06:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724481313; cv=none; b=WXMw/O9clbrz23kjjluPydqfvkuhKs97FhxlHuMD2atHNPvyJDHNl9kNQp+24U419KSY6r9xACdMenRg/Zg4KaeQcJM5kO/vcI1hAgXzJAMGN5eiTOhZzM40f7O7hwN4pgDJZsDnlEWupyPSMinohzXa+i3nuwLy4P9zgMqbgQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724481313; c=relaxed/simple;
	bh=TMgOLqfm30b86e4ts78f85wexaylim5TyQN7MaiIe6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lV6YF5to1qeqDEgPF0XRkVIHGT7uVtbtifJ5Ku6n6U5nFUngh2E4rzHhYzeQs/rOfFZMQ/KnlGyJgdRxT2HlzPoM6iPBejQwrFhZmx61dwuLon3DxhXVIK14KE6R7bdT/PT1R191Bq74x8H4YW1paM2Yo4kpPuFtJHgGaUkdVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FvkssMyK; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FvkssMyK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0889F4038B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 06:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEBBxOFsllEV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 06:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.242.66; helo=msa.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AFB240386
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFB240386
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=FvkssMyK
Received: from msa.smtpout.orange.fr (smtp-66.smtpout.orange.fr [80.12.242.66])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1AFB240386
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 06:35:08 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id hkMasExHFZ40ahkMasoNh6; Sat, 24 Aug 2024 08:35:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724481306;
	bh=IQiQE8ZAQ9sR54pSRg1laMkFOYw/GV3RVSf0chmw70Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=FvkssMyKKbtvTjFBaVy3HTS8GkfFynWH7jhyv0nUCxq4+Cy8a9bkg+bnysYnxnuC+
	 0czd8gSL3fy1ukfiyFgvVTixm7V2dEbapg0Egi2/WeP3o+yYZozDZlIeCDuwZ94RS3
	 qBFYCG58IarylkSwnP5Z6eReAtzDW6NQ1GUKvbsj7ehe0jfyberviSh+WqhUV2EPdF
	 MZYzGlOBTQw1+sq8nFKJfCqtrfZGVoKBvbKc6LVMH253McVgnjKEPvUkjxCTCsOvTb
	 zV9fu4DpW8hNBF3brwKK5QjLCV/y9dEu6E4sEkivkSara13O9dprMRpwbJmBm/brB1
	 aEXRTXlIhlrBQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 24 Aug 2024 08:35:06 +0200
X-ME-IP: 90.11.132.44
Message-ID: <77e4dd0b-2c82-4f00-92a3-069526a5f795@wanadoo.fr>
Date: Sat, 24 Aug 2024 08:35:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 gregkh@linuxfoundation.org, tdavies@darkphysics.net,
 philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
 linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
 <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 20:23, Dan Carpenter a écrit :
> On Tue, Aug 20, 2024 at 09:38:22PM +0200, Christophe JAILLET wrote:
>>     - if a "mode" matches, do we need to iterate the whole rtllib_modes
>> array? (have a look at wireless_mode)
>>
> 
> Can only one mode be set at a time?
> 
> regards,
> dan carpenter
> 
> 
> 

Hmm, apparently several can be set (see [1])

Base on a few lines below, it looks that WIRELESS_MODE_N_24G is 
exclusive from the other ones.

So the 6 char array seems to be sized either for "N-24G", either for a 
concatenation of a few other modes that won't exceed the size of the buffer.

CJ


[1]: 
https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/staging/rtl8192e/rtllib_rx.c#L2200
