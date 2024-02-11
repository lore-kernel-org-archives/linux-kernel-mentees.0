Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103C5B5D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707667590; cv=none; b=SjBnrIhqH1Of6M9ZX5kuZMtx+iF2LUXRwjyZFXA756/Sgy9vFHBzAQfho4i8HFWVrD1V/oa6l2EbHn9BwXKDI8/Nw9Cm1Sf+7Xc6sB4ysyv43+jHfyd5PmLAFni7XwE3v2bv+laREUhfsgicqmn1vvdY7domb/TKIMd62VInz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707667590; c=relaxed/simple;
	bh=J5v1lilPiTlSOrg+FnUKeXivswZYOjGz4FkxGbLee5I=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=l0808jFsjs+L6wkp3j9kqyiZVTkNdaCF08cJrtQ3UL9Ug7PmkrmcxUKrFm4Ae1iqXBX7wq2rLekD4ljfom9ddpXfwFGmZAdXgx4BPy9psWwJsrA+0erclvc9Phr3yuF9EP1YEjD2ROppRXuecE2hpwSU2VCMSTg+Yhay7a/tkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crzKKZq7; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crzKKZq7"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5F5C60857
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 16:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrtmEuJ-5yj1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 11 Feb 2024 16:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34DD760853
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34DD760853
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=crzKKZq7
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 34DD760853
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 16:06:28 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5ceb3fe708eso1733624a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 08:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707667587; x=1708272387; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5v1lilPiTlSOrg+FnUKeXivswZYOjGz4FkxGbLee5I=;
        b=crzKKZq7reNDm55FRJZvJ+o89as819cRbUXLIC6yKgP2hKsf9cIXlA+wJ86DTwFq0/
         bGtjy+mLUE/Jj5GfIYGypSMDyq127Ye1ajs3kG/PpJmPR+lQuzKm3rirooXJv7lfds33
         XSfUyBnCy4uv3t6PUnBMJPHAivJ2A1/lOC79yDc5N8fFurQgyqjNY0avZ9yzAdc+XU6K
         JpiWMRpOYHdVoBjNMxxCog6DI8v9B1DLA0L0lYYsLSPVyhmoIeObKhrF9O05zir7Pc8+
         gotImGLQnFuJZZhuGrfRH7FxlzLRWLa/ogCk8tStPjDF0ANZL/oI/Bo4jQ8j7QnoA6ES
         2/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707667587; x=1708272387;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J5v1lilPiTlSOrg+FnUKeXivswZYOjGz4FkxGbLee5I=;
        b=aLu5NJTJWJVz94WY+EvJ8rNU1bQQ/BU4kkaKtOwsO9LB6mOvFJOcOOIzUDirhKZJjc
         /mh1RoPWuXmw95/Nxbc0+fUi5gGBIpgoct2OzWpx0SQBmhamiQ4lE5Ln+YIw8pTEkgLc
         QS9wRBsYbqe5Q6c2qEzY2JH7q+Nh8aDOLdmba/Cpiiz+GyUT+69/fiGe+efcQQqK/gzP
         9vKK5Cm2IbzN+J+pCUWTowKxuKTuJHvFysHaATQobyf1TO7wuj3ldISTyb+mR7xXBhPL
         BHwD2kkl69I4zDjiBuZynS6CkWnsbCj5iTIjC4C9FNPH8vcGdu7Nk473V518OCNeQwk9
         WU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXriFqIjOrYictc+8WuH17GBMzhZKhzvMrgkIcS4xtGAtFagHhKSUYPXPQOrzsOc+594+F1wk28niUEscd/Hc+I1UE6G9zZRSu80rcrn2hapOdG+tX9jh4yQ2dGci3l
X-Gm-Message-State: AOJu0YzUBWZxvrXCUXwwdF+bOIL8zI8bgII/mBs9mrgq3lfQHT7Do04F
	S5X/qKO4z7o6pK4wRRzqDHmToiR0BOBe4b7R4IJ8iVKGdOkb4Jv6
X-Google-Smtp-Source: AGHT+IGBoWdAbZqysUxImCGwE8O25A18/b8hOtrELQdynZGxaAhikmARfR7WfEA96ofwjCVdk5AZMA==
X-Received: by 2002:a05:6a00:d71:b0:6e0:51d7:5805 with SMTP id n49-20020a056a000d7100b006e051d75805mr3198339pfv.1.1707667587477;
        Sun, 11 Feb 2024 08:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz2Qzb9GZhStD6wRQZtPPb/PVsGvWS25k2TnMXC57Yd/y+wktpbP3LMphYxo59+hVppr5eTTSZ7m6S5kLoVPxYgpPpDHStG+2cH7UDBB5f3nqmmFqmdUALcVkaO2IIZFDbLK0WPm88xTPPG56BXLLui82BQVW+PhAq3tGLc5c5wsD1cWkeQnBcvaX5lSJYD9gda+gB/XzYuT5KOc5/XcfowUlKS7pk+45EXBqTxEyYNHcUwzafcma5D8EjH9WgIv2mtipDw8R/1VxvK1CczWei0EWDYZSfJ50qsLxjGRKouDHKJ4D0Z1h0hRVjfuWWCPl2ObPK9wMT0O65JLN5aOn/MXNe
Received: from [127.0.0.1] ([106.221.225.147])
        by smtp.gmail.com with ESMTPSA id m4-20020a62f204000000b006df50bbbaecsm3864390pfh.86.2024.02.11.08.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 08:06:27 -0800 (PST)
Date: Sun, 11 Feb 2024 21:36:18 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: ricardo@marliere.net
Cc: corbet@lwn.net, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shresthprasad7@gmail.com, skhan@linuxfoundation.org
Message-ID: <daa83658-8d78-4aa9-bd59-26b274534f57@gmail.com>
In-Reply-To: <qhnapkrcmqvpagzii46be362iyaelcbodo6vh7v3sem3ww5kpl@nw65w7gbyjij>
Subject: Re: [PATCH] Fix malformed table error in gadget-testing.rst
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <daa83658-8d78-4aa9-bd59-26b274534f57@gmail.com>

My bad, I should have checked beforehand. Thank you for your help.

Regards,
Shresth
