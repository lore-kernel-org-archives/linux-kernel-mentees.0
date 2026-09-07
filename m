Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8946D087
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779884; cv=none; b=jN2C+pjySV+AVIZyJJMC1YNCMvGGywpz0ozJMwcwEiHiZdsnQ0sVJZaLZP4GLRWafMtjI4KHK97y7jtqMudy6jTFW+B+zpXkZfYZ4Js2iOCSvPFRQ5YDBTlMmgCooWdi/3YwV/YxcRkl2nKQgxATC34rJ3BZp6oHNM1r3FPUjW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779884; c=relaxed/simple;
	bh=XYqEV1M0GpB+fKUY4FbmTaxiqGTleihRUV7J7Wx1cSI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ahWn6b9cYoVobjEkXomZl0TXwtxHmBnURJ3p1FCuwb16BBqAi5LolrMSpcO8Vjdf4fANt9c2oBp+XLJhnqWbcGjOKY2FHZZbgZ03CUi+a3nWzVWfNToCHsT0ouycOf1EwETusoG9WTWZYHS6/8Y4/7mTID0GLVYGcWdjMQMISqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVlSSzRx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVlSSzRx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482ea739de2so2293620f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788779879; x=1789384679; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XYqEV1M0GpB+fKUY4FbmTaxiqGTleihRUV7J7Wx1cSI=;
        b=KVlSSzRxoL3UUuO2eBar9sJ8EOLXoZvbPHSx7yjCh9yHZdKV/MPHi65xJq0G+4bsuf
         pl3EYvys4c1yBw/uVTw2wIYIrjB0OzKfbwsRsAuTx1WR8roBNm2CdJlwjvkXm7E9yAMi
         k4BEa5vMle4N25BX08vYMZL96DevgJrnPPnEI5uLdGvVWDmxuMOtmXOIdr60mJ5YBW3X
         pmmtAzgqcT/UTnsZyctOOx0FftSSrMedTns2jF6iOzLhZob3zqTxHPmDFNp6T0U8zzJg
         iJ7PwaAk3ADYV/whkXn2abU+W6jFyvXQqJ7bimJxni4pHfJpjFyJFsEDXIm2TesHCWIg
         lFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779879; x=1789384679;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYqEV1M0GpB+fKUY4FbmTaxiqGTleihRUV7J7Wx1cSI=;
        b=Egm3d6y6vo9YreC5PxnCI8WmbGw/s6M2Q4P+eNsntrSPvuaa4q9dwfHLUF3aJPqNIm
         f3g++r549mf9VDRsZMNUJba0C2C+5CaXJd2GrLd4TFvUIjEDxpO+RRn7wQ2oldSNFxi6
         LcVrAC8RSOe4GUrgU2czTxryqNKuGkeT4jd/jq1us7ev/A2K1URnX2aPmMPK5/OYYxfY
         ByVWYCsGRrWHseQ4C15sfBSWPw7vs8Tbdo+Vg/zdX/FHBkjSZKCa70yKpmGVLfWswE1E
         +gAbx4gYjCApyclEYo7oZ9v96FGRoFzxgOIaX9z4TaV+MQ3r2OyH2S/DMwGFTnumuZqR
         VqJA==
X-Forwarded-Encrypted: i=1; AKwUvByxvvIzFMdqmxEIzvpjlpKUScpyuAhjCey8mBGbMV30BIi64QLqoGEYNcjs+kweRxU/wXpQYS/uqHQcJvK5OSoaDEvEvg==@lists.linux.dev
X-Gm-Message-State: AFuF++ke1UzKqrQ3tLxdRM67hlpDsyFb174xdFnLUwlXIaSaTrkRzGEr
	mj3vMrTbA16I9qD3+As0d8rruvniKP/afEZCHubpwchTqi7oD8q2akQ=
X-Gm-Gg: AYBFou2LmziqB6RzvjmPNXGgwkk9BMF0YZzMMymYKPi8p+RoXiZAFJrbmst7yMf/ZhX
	1IpICCjgb9N6vVSVSeDKgKr4f+qicTPvloEVxVdPiQNuAqBdCM7FmqxOfETosYVJD6Ii+6wI2fs
	DBnhkBQrBG3YC9PB2A8rsqHcvTGc/YNNDxpOEU7LzI0nyTerztOq99ZGFdJY9yNF/jrELmlvD3M
	hJPqCvJAMAFnub47T6gOaRM1pdSrmAMs9rUceV8IT9OJsGz2CMQavuj+k38793lmsWyQ/YLI4Y9
	7r/NLCTTLIWwREaRk7RdWByM1Ex8V1ANxrE8g1zgiuIyiahHcykwkUs4y4gaOyYJQsJh3ysaebo
	DjtdfVNEuo9Iu3QToQrh/3xwgdfL4EQAijKc5ylhVSklJ0gMmTpbAD0lhx4iEO455RneffoaIis
	f9DwSdq4YKyiJYTkS1Vwa8dEliRcVvSiVWLD666/Mvv/V3kHyugEtctkgHqyRl6zBY3xzACRVYB
	RhN9MxnGGwKWcz6k+Hrw3RXY1WW+dfEI4O8uK2hnGr+y+gCLHRIg/6RolQD+gLuXI7CdkSDF8EP
	8zYQJ0OOavDRkCYAQwBmlPc77CKESodCihF9hlJMdn9YJHkhziEhMrlWoTSPaQ==
X-Received: by 2002:a5d:55d1:0:b0:481:4697:8808 with SMTP id ffacd0b85a97d-485872dee4cmr22090578f8f.22.1788779879457;
        Mon, 07 Sep 2026 04:17:59 -0700 (PDT)
Received: from localhost (92-242-248-12.broadband.mtnet.hr. [92.242.248.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm16032918f8f.0.2026.09.07.04.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 13:16:59 +0200
Message-Id: <DL91IWM6YXRN.3892K60CVKZ3U@gmail.com>
Cc: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, "Ulf Hansson" <ulfh@kernel.org>,
 "Guangshuo Li" <lgs201920130244@gmail.com>, "Runyu Xiao"
 <runyu.xiao@seu.edu.cn>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
From: "Jakov Novak" <jakovnovak30@gmail.com>
To: "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>, "Johan Hovold"
 <johan@kernel.org>, "Jakov Novak" <jakovnovak30@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816153809.7067-1-jakovnovak30@gmail.com>
 <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp>
In-Reply-To: <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp>

> syzbot has an AI-generated patch at
> https://lkml.kernel.org/r/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.kerne=
l.org .
>
> Please check.
I checked the AI-generated patch and it just uses the deadworkqueue in a
new function. That is the same thing I am doing except that I'm using
the vub300_queue_dead_work function instead of writing some new code
that does the same thing.

The real question is whether mmc_free_host should be allowed to invoke
the sleep function or not. Geert needs to elaborate on that since he
added this change in 1036f69e2513 ("mmc: core: Cancel
delayed work before releasing host").
