Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EAE18A947
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721044978; cv=none; b=pC4ZvJoF2rDgmG59/IBvC+iIIvjka5F/kyN1aiC1eR3tuz7ZDj/H/pKy2u3CeeB66Itb98BaCzarPz52wAp87AYdox70EiBRjl2KIvYP+tTbzKXKfAJANkcVCnwGlXl4JMOu0Xfae/b5OysRgo2eZ+UMuFi8MAs7s1Mxs/frfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721044978; c=relaxed/simple;
	bh=hQ4tXwoe7PZNQk873EVMFSH0aat0uH01m7R15qpqRe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Se4v5wc/1mr0T4qC5qy/loHWw/Uz06qvgM/y8mw59xDoxJZpeWP+gehFz2m0X5v+5gkupuZVpwyrl5tI7Avhi2BL+oh//04GPvfW/5lDEVwYcBb3WhG1Fh+9ARjaAP2Gon1adeQBZQqedcb9ulxA+rAqtqmOXxbi+PNKIUQJkhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87E93405CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 12:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.2
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBYtGRrl5Roi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jul 2024 12:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dev.jain@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 713BD405C9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=arm.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 713BD405C9
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp4.osuosl.org (Postfix) with ESMTP id 713BD405C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 12:02:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2143FEC;
	Mon, 15 Jul 2024 05:03:18 -0700 (PDT)
Received: from [10.162.42.47] (e116581.arm.com [10.162.42.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7C893F73F;
	Mon, 15 Jul 2024 05:02:50 -0700 (PDT)
Message-ID: <cde5f188-9b7d-4a7e-9d13-d431b54ed7a4@arm.com>
Date: Mon, 15 Jul 2024 17:32:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: missing arg in ptrace.c
To: Remington Brasga <rbrasga@uci.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240712231730.2794-1-rbrasga@uci.edu>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20240712231730.2794-1-rbrasga@uci.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/13/24 04:47, Remington Brasga wrote:
> The string passed to ksft_test_result_skip is missing the `type_name`
>
> Signed-off-by: Remington Brasga <rbrasga@uci.edu>

Reviewed-by: Dev Jain <dev.jain@arm.com>

