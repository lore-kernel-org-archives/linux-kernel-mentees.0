Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A72746A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760270284; cv=none; b=FH266XH2m4OYttQqasRn7OU6q5U0L7bUloyX2YfzFQnMdIhsMhEac9567/mtWFtY93iRdA9S/VOKQTQ1K/00POdl1ssdO3HMxbi0xmEfT5hQC/Y9i26cz3HDa8zkKx17ivsZPSJH3UOnsFkFBXAbgorkF8eqn5+CFvS/LYOwd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760270284; c=relaxed/simple;
	bh=NwikYSMObjIckD/B3pq/U2VJ6Lh9h44qwNONqewjv6o=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I8/Xqs79kMsTB8d+u6/zospPYLEZdWtZg4oOcbUD7dwY9yYExF6oXNFhC30tbcN/Zhkhh3oSzoRpChbc9y8s93IaP6gDPhHsR5MQ5oZlbxP+2EsXuQ051qKv1veLha3TJxs6OGsGss/AyFnyxK6BWug+Ef6W94P0lm2o5eY7f/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qHVJmeih; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qHVJmeih"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D16140C41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 11:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.153
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9U3Bz7cH8lR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Oct 2025 11:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6BF640ACE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6BF640ACE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qHVJmeih
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E6BF640ACE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760270278; x=1760875078; i=markus.elfring@web.de;
	bh=hWtOLCQ+DGp3AMt9iKbzx4fDPilVO7oW59bVfPk8WXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qHVJmeih23Os/I38PWaqNUX6p+3AzJwXrLyQ+HE0wwImszIef65txOedGWyMD09c
	 IErtrTzHPCqU8YZm3wxl5T7FJMpUsYAqLpJ25alXTtyYuzLcH3kQMCxCH7ErIk922
	 hmBJutwwEez34Dr5WDp+rAbYk08ez/8Ynkmy6bwLFnm5D2pT4dPDRVhPnwWpuPCEC
	 8xH6PMtAyxfCh/bxCesIZrkuNTCYYBcDVpu+z5F4qrRvziqXgsOLqBIkV/h7lM/Su
	 Rv/xaUDKghcIGGx+27erbRocc6xxw0hE6KOtBtx9DxBreKzt85V9Bd2Ys801QAjp3
	 1xsrdRMWLGpDYtmN6Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLzn1-1uq6i71PG5-00Rrna; Sun, 12
 Oct 2025 13:57:58 +0200
Message-ID: <fcf6c291-63d2-4270-881f-1e97d3854ae4@web.de>
Date: Sun, 12 Oct 2025 13:57:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ranganath V N <vnranganath.20@gmail.com>, linux-hwmon@vger.kernel.org,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>,
 David Hunter <david.hunter.linux@gmail.com>, khalid@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
Subject: Re: [PATCH] hwmon: sht3x: initialize variable 'ret' in
 update_interval_write().
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z+Pmwq2nSn2kFJKajdydpxDocwirtx38mu+1JsOG1QOJgqxJBea
 lcR/17xWKM+3f7090Kj5TcsJs7ppXiUciDvZDEEnXVmjwc7q6tSxp5+X4JR+w1I79HnEb+D
 aE/Z23CE+10DMZIJwVn10sAL34WtVFc+nnsLplq+pD2ebAADBccNQNx1c8Z200aEimBB1cP
 NBC+iAmCxqWMCSFsyMXYA==
UI-OutboundReport: notjunk:1;M01:P0:NzaA7Gv4ewc=;s8d0gQYNeCJ7bDnhJBF5BAY5NiY
 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
 SJq/L3tcefnJRUwJE=

=E2=80=A6
> To address this, initialize 'ret' to 'SHT3X_CMD_LENGTH'. this makes

                                                           Make?


> the no-operation path return success while keeping the existing error
> to all other paths.
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17#n94

Regards,
Markus
