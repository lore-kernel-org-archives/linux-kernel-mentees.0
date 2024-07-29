Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B963187844
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278456; cv=none; b=uD6LNrQN0UiiEmlj8g9lH2VZb4wLfjeJhyDaU61hAvzbfNris0nqbMeoSfSRx8joN4EezFhj7v/xbzJIF54asia7EqMwinAiLgzqcttd8eHyFmxrI6FQcad8nAWi7Yc3iDzEZRoaf2jLGkSGseP3HdCRJdTGXgon/RSoGRs5RGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278456; c=relaxed/simple;
	bh=m0WyG/aso8uzUymjHwhe7HmgW/CUfB5c/IBX9t6QXdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oo316qVFJdZW7p18VqSDx+fuYc8pnuI/J0jf6cbCytktUISVWjidY9xlbXEPl1DyllVWeDdbFmgwluTOIY+6s8wwlhVMGgzsyIRJq0lQ2zGAuAJLqswAe7KUNKEfo3DSA3fnXPmRzh9t8B0t3E+K9hR3SQPD69sqD4xIzC7Sz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mhbgef0T; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mhbgef0T"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74A180C94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GoM-wX47prT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 18:40:53 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9AC4580C8B
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AC4580C8B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mhbgef0T
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9AC4580C8B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iUdrC/iM7m90SNhQ6UKmv8NB4lWo9OrmVGgOw6RdPKs=; b=mhbgef0TN6TLf/9onqtaW7nHdw
	jamuHxwi2zUrkF8iXfgdQjO+MfqaT2UUU+qwbp56/vg3rzb6SDnPiKuC4NlX3ATmrG1KLgsE+NnIU
	9kIXX1FQPnUtQtuzSHfwBryIUngWVMrudp4egAjPKb1Qqq4NaAjYztn4+RomvS4hhoJgz7/zyrL72
	CadDb9cr+UfkSUBoBNwyc5Zl4OBAQ06rHTcRYTxWH7Z/gmntTdTSKW4wfdaqtqNoCcirtNGWNy3u2
	DmP5FDyikhxWMWv/4R1PSgD2JzEYTCW/SfObRaLRHOlN2hiThAmpc83rGwmyD5pMgaidpXSTAG9GV
	cxJuCHzA==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYVId-0000000CNOa-40oV;
	Mon, 29 Jul 2024 18:40:49 +0000
Message-ID: <b1e2d43f-93df-420c-a831-5ff8e33c294d@infradead.org>
Date: Mon, 29 Jul 2024 11:40:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wmi: Fix spelling
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>, W_Armin@gmx.de,
 corbet@lwn.net
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240729164721.125708-1-luis.hernandez093@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240729164721.125708-1-luis.hernandez093@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/29/24 9:47 AM, Luis Felipe Hernandez wrote:
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>  Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentation/wmi/devices/msi-wmi-platform.rst
> index 29b1b2e6d42c..31a136942892 100644
> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> @@ -130,12 +130,12 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>  
>  Due to a peculiarity in how Windows handles the ``CreateByteField()`` ACPI operator (errors only
>  happen when a invalid byte field is ultimately accessed), all methods require a 32 byte input
> -buffer, even if the Binay MOF says otherwise.
> +buffer, even if the Binary MOF says otherwise.
>  
>  The input buffer contains a single byte to select the subfeature to be accessed and 31 bytes of
>  input data, the meaning of which depends on the subfeature being accessed.
>  
> -The output buffer contains a singe byte which signals success or failure (``0x00`` on failure)
> +The output buffer contains a single byte which signals success or failure (``0x00`` on failure)
>  and 31 bytes of output data, the meaning if which depends on the subfeature being accessed.
>  
>  WMI method Get_EC()
> @@ -147,7 +147,7 @@ data contains a flag byte and a 28 byte controller firmware version string.
>  The first 4 bits of the flag byte contain the minor version of the embedded controller interface,
>  with the next 2 bits containing the major version of the embedded controller interface.
>  
> -The 7th bit signals if the embedded controller page chaged (exact meaning is unknown), and the
> +The 7th bit signals if the embedded controller page changed (exact meaning is unknown), and the
>  last bit signals if the platform is a Tigerlake platform.
>  
>  The MSI software seems to only use this interface when the last bit is set.


Acked-by: Randy Dunlap <rdunlap@infradead.org>

after you add a commit message.

-- 
~Randy
