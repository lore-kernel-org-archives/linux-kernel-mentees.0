Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE12D7DD1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794141; cv=none; b=YCPmPo3HuewJSOm/i7bZLci91J5KC9+Ry5c25WBWNtmvKP7Xjjruix2YHWVA4LNto7QtWHnP+5GfVEOENdEu1KR+nFUONgD9fHA68Oz8RFcW8fj5PYCIi6YrwezOzITO7Nu3lrt1aP2XOg/wZzCkeiHd3Nu8SWK2dtLTtCcjvYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794141; c=relaxed/simple;
	bh=nsnwlSBWxNXdZOIgg9WHa3Pyz2FyXAeKrCA5+GIwzMM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AokUhwmb8S5/A2SyuDS4FRVssrcpuUNE5a2mRYx1JHQJOrHnH2t0o31y3OOTNZAfq/GqFBv9CIRzCmhnYzYDs47OofuE0JH/idaI5uk5v2aAbbqhmbLDmyPZUtVH26F2axFAbUAwmMTKBVaLMUoWLVuAxeEon3We96x2QnAc2MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqZlO4rI; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqZlO4rI"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 999CB6143C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lghO9pQ8WnA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=spyjetfayed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12CD16142A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12CD16142A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RqZlO4rI
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 12CD16142A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:55:39 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27ee41e0798so1250015ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758794139; x=1759398939; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsnwlSBWxNXdZOIgg9WHa3Pyz2FyXAeKrCA5+GIwzMM=;
        b=RqZlO4rI2SYfZYkBjc+h20wg5U8ynY9oPvFp2dHwySsErFKLP9vdowc2iYtgMjfRF5
         ynTnORT0KG4bAfjl23ye3TzMZpmdSI8y7NqQHdk8PNcrwVVZtSeL+cxJHCujIlywCoZK
         x10apLraNxZKKeVGt4kc54HkixOBLxddHc175Pf06KClNy3uY1LzwPUoze0NX3eCwLUK
         w4aNezTkS1Jo+wDXR0Z9M7TtD0KzwwRNs3NK6LYv6+Giiue//Yes/Tr0PRUq07ukMVBG
         h1HvUKPnk8YKcp8PGQZJZfD72ikh0gcmEBO0Kzb+IOzrnjYdntv9O7qtblm2nM4Gs9aO
         rfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794139; x=1759398939;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsnwlSBWxNXdZOIgg9WHa3Pyz2FyXAeKrCA5+GIwzMM=;
        b=TTcRlZMk7tNGv5ibGWC48De1QTL/keTSXhfksR4t0BWJay5V2uYObXsTtnYneI0HCX
         vydqszY6cHfkrdg902fQ119bA6kVaPTwFbHQiqZiSNcebjtx4D/MLsVDQbHyHKNvBAmV
         93qeV5K2U1JmjggLUZXV+FZ95afOtEEkVXOZTk2BjqSv2LSUZmGn9XqaTvIjoNUXlDE1
         Puai5Zl5aSkhXGz+zS4/px3q6myJvrQRnPVUZ07LQXUo2yZ9YqDmEB1HjnXeD7wimAfr
         he4X9vbDTq8M9wsg1X/hLP05w7JOdym85GPX0qMWFe10YfhPorejXyQk01BEbht12ILv
         vr2g==
X-Gm-Message-State: AOJu0YyHgQ9O+v35tzhzR8kziYSS6mUix6psP+WQ3SqI6jb8ftqpGhw7
	NkBxHiObK9WXKjB8tV1n6CoCFHIRk0yF4K5IR2xrXvZ/5DiMcZ8RK8+b4gWoRK32
X-Gm-Gg: ASbGncs6GiRw9LtTy1NtI4bbcUDrWiJfHyPP1wfPiEC9KkkftDfAfRF3N/TkXpD2y4V
	DZUrIfU7sJkRYMx30nSXTbkHSNapE+10yA9RbwMzVJI8CwAgKqz2YF+PSq4f4j+hemJ2S7fXLKC
	VBgcLL67y38wlVZu+3o6Xu0D0vfAb1UJBuJ0x9GADF/yN2x1sRfwabhL9bcfITtOGXnp/gZBGJX
	yckVcqHzMNDhZSjd3Sm68Ad8aYGt7n6GphkrvDFOEyn4OQrf4Osghx+pZYtuSeuanG5jTCS4tlm
	TQ/+MPrwO5sU0BEedTjdvazmC8BL9NgJ9qQ8k8gwCdrr8SZ5kuhMjrsaGzLhn82hliKu/DberTU
	nV43lBbVoYtsV/HyrQVfjsOmCOKj2SQUB/WOqxXbbjAo4zikfCCuHn4zzFSGwQjaEx5tWoaucSA
	==
X-Google-Smtp-Source: AGHT+IEF4IFp0G7AImiPHLit9f3njIaxCnWqwbc6ys1XWjoDyFhFo9x2JHu3YX3Kn8cmZteU/likrA==
X-Received: by 2002:a17:903:3d0e:b0:277:3488:787e with SMTP id d9443c01a7336-27ed49b85d6mr30018615ad.12.1758794139325;
        Thu, 25 Sep 2025 02:55:39 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3fdcsm19333115ad.23.2025.09.25.02.55.38
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:55:39 -0700 (PDT)
Message-ID: <edadb301-9fe6-4c3d-a640-e7de9e3fcc11@gmail.com>
Date: Thu, 25 Sep 2025 15:25:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Ankan Biswas <spyjetfayed@gmail.com>
Subject: subscribe
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

  Thanks

