Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70A1DFDB8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759509478; cv=none; b=lNXryg4QR201cnKOPBstwM73qNUBRVw9UKH52BZwryCWXIAFDoJlZ/KjfTXGNPtqN6isYVD1z+naBzAE3jczOLjTctGCs/m4lVWyZe0WJ9/crJcUDWfXKFc7EbOSaQHUj5Jz8l1lJpC+IxVzh7W6ymqlE3VB9Iv+WIM8Ulz+oAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759509478; c=relaxed/simple;
	bh=yAR10OIPN+DTvGbJQsaMkX4gzSxmUi1IfJPpGjjCZCY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UHfTEZd9FT9mmH2kqZmKM91d7oTr5D5Lb4uzuTcrb0c9YCyOxp43qsdI5Pwh/wlz6waHz3khDnbduDrBqDrFC/BF25+tcKeFR+dO9obEnDR3H0YFPSLteMWbWAzhzr6i1xlYHjdNCqldG/EyVFVQDpvr18ZHKf3Rv4s5lbn1xWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FEYuut1P; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FEYuut1P"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A074960C13
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 16:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.788
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RITWYMVGPTHf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 16:37:56 +0000 (UTC)
X-Greylist: delayed 328 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 03 Oct 2025 16:37:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25229611C8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25229611C8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FEYuut1P
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN> 
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 25229611C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759509472; x=1760114272; i=markus.elfring@web.de;
	bh=yAR10OIPN+DTvGbJQsaMkX4gzSxmUi1IfJPpGjjCZCY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FEYuut1PkGSh5lmNmzyY1h+HnBK5Pf6q1wbtK0ef3M4jN7lN2srjrO4BpOINwAn0
	 May40Lia4d8oIXCydg9JwlFQLkR0J0HEzREfQK0p9i0ysV1IxrsjnZgWOnAtdbHFg
	 QF7p08EaWm9AEhEoq7Cky6X7ycZNyX19x6f5rUUvLbW+zZbptH9/XPklhYoLsC3na
	 YhQ7kWPivoOgwnKE+yLf7q4LiMfdkbhQya/YUDRd7w7kREaTy9mcvJPp7FbxIBviL
	 LLpRl3USgIyq2YFX7znU1lH76iB30x3xzK6URFMNDe5DO5fwOOwNXvC8sjfc7l+kV
	 LGnuSWs3aoPfAFk0Qg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOm0r-1ueVPe1CTn-00UBAU; Fri, 03
 Oct 2025 18:32:13 +0200
Message-ID: <77f2a45b-1693-4106-8adb-304e0e818d82@web.de>
Date: Fri, 3 Oct 2025 18:32:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Erick Karanja <karanja99erick@gmail.com>, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David Hunter <david.hunter.linux@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>
References: <20251002174617.960521-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] net: fsl_pq_mdio: Fix device node reference leak in
 fsl_pq_mdio_probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002174617.960521-1-karanja99erick@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8W/6qW33cw+tr6rspLzq0qyhdNS6PMNpOaUXr5sL5jZUG7xARm+
 8bv2tD70HNQ/cjsZfd7mEcksa9LQQrJe1OBHsWh3Hy8LePCxs0wr98qy7cdrU3sW+v403p3
 6dDvNH/m8qTY62jVZr6ILq0wth9jfFwUSfsxjuMcZrZvuoyMV5X0EYzGW4eMlpV1mXs7dGX
 zyiaeaoOxX3nl0bZKac9g==
UI-OutboundReport: notjunk:1;M01:P0:/vNfIiMX8NE=;1phbWNYNmSmIDNvotBUnsFWV417
 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
 YxpkIyEKqnVfYA==

> Add missing of_node_put call to release device node tbi obtained
> via for_each_child_of_node.

Will it become helpful to append parentheses to function names?

Regards,
Markus
