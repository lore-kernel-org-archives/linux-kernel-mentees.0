Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E588417578
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Apr 2025 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744582289; cv=none; b=aYjOR18mK9ZwKu/XVPaoukFcygaFM5AQuFw1uqHlyo/y1sdC8x8LF/XsRzHt57lc+FGjNe8O8z+IjQTuJgYz4j751GndrCgDKfCksRRlnlzG/fmp0oWLyWaD3MBhtGMtBPCu+z26gfF53l1ieeKXA/CIHKlzGg+wFw7gZHa39Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744582289; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SeV+eTbJYlxEwqTzgnGl93EEm+09r7fSTyQqewoCPGKzcg5scn8GQqi14rXrQ9895L5LRnSzaPt/0b0pYETHmuVNNgWTmqPp7QSU8AGyDAhcKc1soLJpOoJckPXhN4QgNcYwxlFG2F5DRGRmDWhTHJr5UTcqlCq/nBuk9SS35Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C69141202
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Apr 2025 22:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ-S6YjKnNoV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Apr 2025 22:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.41; helo=mail-wr1-f41.google.com; envelope-from=sagigrim@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7895540FA0
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=grimberg.me
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7895540FA0
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7895540FA0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Apr 2025 22:11:27 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1887891f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 13 Apr 2025 15:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744582285; x=1745187085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=K0tMywCRtbX0yCL8nHKtOUbtG/uAraljMdIKf2pdF45ECGKpG1jBybYv0+8zZnCc46
         laDvXxvM0um+7WWbvuhdvI5i5KHEOnW66WLjRvFmaDVwimTt7TQEYMa3Xm0i9WTSMUZk
         +I43bOsbyzCyu45p3LGApURheX+/UOY9kwV8eCFw2AGgij9EKHI4ruk4X+3htQySz18D
         w8o4OwvYZDzvsO8F4fp7QR3jfrPui7mKjyz8oorz5A9QZMBh+sLjEK8qdyx073a+YSD0
         v/4/qDLim5CyAwi21eROHwnvXGNC9HeIxesw0XYJsAH7b8JEUkR3o+Mej4RICAahQOYL
         YYPw==
X-Forwarded-Encrypted: i=1; AJvYcCVrDw/DOdkLtGaN6oDt809Ny8QdbH7g9ltlKHf+LXDlKyaFXjWiDR2FL+25yXFy6fYVp8xg10j9YTcuUWTqBynBiU6DEg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyTKApfFwPk03HForiGrTc9z/VaAnp8gF5HCPDNKKDcgId0QFlv
	ALA5ASLa3xzo69lelY2U5YQkudTfo/wK+CcY8jjiMn5Lc0LwdnSg
X-Gm-Gg: ASbGncuz5ORuHTguFngPb+aAxBBJfyBCUeQUoQ19IQ/Ig/Q6RyY7/g8jOXJRme5D+RJ
	e+59S6hxcVtGgUyTKPDxPO5Ug/5Pfq2MWYbVzNYqwTOJt2QL/dPvcHdH/ETQ0RLTdBBGJEf/nRB
	jIBBZvp6nJiSfTHCXJwBPldQ1LwLgQw5DdD+LQAfBQLXV57WWnbhvxxvIrJgUmI8pmYNO1xI7MS
	8xpXfK9gqWfImNlppvxUh9VwU9duZRjc3R7QYSZjc/V3efjLr7Nihl9VS4bZitVIgW3MAKvE/dR
	tnGhTmYUvXg1zVkVFRw0beQNBgegg5H/T+sU2zNBFCwQd1ot2stkMLyU1xkf4Yo++nSRbk9X
X-Google-Smtp-Source: AGHT+IECY5XYow+opudYnlXLiLIz9SnQYa9O5VZpi/wrmLJlyiliRrur42MGbUbekQ80eLIKm3KZYQ==
X-Received: by 2002:a5d:5f92:0:b0:39c:2688:72a0 with SMTP id ffacd0b85a97d-39ea51eee24mr7544676f8f.6.1744582285112;
        Sun, 13 Apr 2025 15:11:25 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fca5sm164696995e9.32.2025.04.13.15.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 15:11:24 -0700 (PDT)
Message-ID: <a19f8b45-fabc-4596-b20b-cc219ddafc2e@grimberg.me>
Date: Mon, 14 Apr 2025 01:11:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmet: replace strncpy with strscpy
To: Marcelo Moreira <marcelomoreira1905@gmail.com>,
 linux-nvme@lists.infradead.org, hch@lst.de, kch@nvidia.com,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 ~lkcamp/patches@lists.sr.ht
References: <20250403232432.25255-1-marcelomoreira1905@gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250403232432.25255-1-marcelomoreira1905@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
