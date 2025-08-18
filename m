Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247D32255E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532223; cv=none; b=tvavX+RyAtse2ZzrQ0kmtRCfphrm9LmOi7TGlMLZatSpznxayyUXt2fkp2JQcjLKn8AUdEVe6zfu/CKBkWbQL6yxQ7292laf2WeIYbKae3X7gKGWlZny2pzosx5hgJYq4w4hYae4AuBsz6FB5p3v+bxn+KI6q12CoH8JjaUojrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532223; c=relaxed/simple;
	bh=TG/w80KxC5LEq8NbqFxphKbLwuVjO5otVCEbIll/TWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sklkBpe0s8tN1liZ3QYYuQYZN4Ifvz0Wc/J3al4TCyn8aNXHp7Hu9wpHjga7xmPUeXx3OGgUFZ3Atg7aaNgqE0Eln03sxnFTHJInENATGmVAfUgYDnDSn7/iJ/h3jFRFwTj2Ubx2UZvD+VnKBX2kAlanXsbisPQosv85EBCgAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MSrHuRUv; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MSrHuRUv"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461AD605A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlcZbvePalyb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 15:50:21 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94B9D6058D
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B9D6058D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MSrHuRUv
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 94B9D6058D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=L4iJdsGJ/6faqS1q8q803Yt4X9FQdiT0+NpuZrEh8Ss=; b=MSrHuRUvDWz3JqFAjGDQflXL9Z
	UZH75XUdDiBAhi7+UacKTOKLMOF48Km86WmzegVNHARYb35pOHB1OblhKYrnyl9XIBQNrZno+7sbV
	/ohYApkagLfrUsvCVKmTCmS1flyrFurk6BPT2oS397xDbCrjFJeZ1ddqXsCY5msDbVIZHB9JuaYmL
	ZNArv8qBgoM3HjVOPodBiRRwea58wycRe+LhmH+tqrpusUDlQIJhVWRfkTMSFWXAqtnlPKO5milCI
	iyD9PEUJliO18RITA3Uf+Er1b7zQy2Ocz5tbb8pdSsMR3ymGXcIqfQPrgHJmHDx81nEnunC6CXSDx
	k81z4O7g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo27j-00000007xNA-1sXS;
	Mon, 18 Aug 2025 15:50:15 +0000
Message-ID: <f051d9b9-8344-4de4-99c8-918c107e37ee@infradead.org>
Date: Mon, 18 Aug 2025 08:50:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings v2
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

1) "v2" in the Subject: line should be like this: [PATCH v2]


On 8/18/25 1:26 AM, Bartlomiej Kubik wrote:
> 
> Fixed missing definite article "states that the parameter" as suggested.
> 
> 
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 445248787e77..7bf8cc7df6b5 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
>  There are also arch-specific kernel-parameters not documented here.
>  
>  Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
> -a trailing = on the name of any parameter states that parameter will
> +a trailing = on the name of any parameter states that the parameter will

2) This diff should be against the source file that contains "that that parameter".
It looks like you did the diff against your previous patch (unless I missed that
previous patch being merged somewhere).

>  be entered as an environment variable, whereas its absence indicates that
>  it will appear as a kernel argument readable via /proc/cmdline by programs
>  running once the system is up.
thanks.
-- 
~Randy

