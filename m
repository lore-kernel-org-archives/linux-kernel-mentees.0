Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F34A441D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789614; cv=none; b=OsLBRJF5anQ1fzGdWLgLaDvv1GdY5YEnyXUkLLV4LezaBlYPtUX6umXwuN9Jah8wpe2ZiA7KhweX8yXfEpxX9AdfWt9rpHM6thtAZAAfHgUDhFOFEOIpDc5m5R7YyqhCaXRw9ghhaofdXUMNv7Ak4zjcTPQjrLRpeCGZTK5v/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789614; c=relaxed/simple;
	bh=p+ILzIid3gZMKSRINTnt4WslPGttrFKh3IKqGQ6yogE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m7ab6ygOxIlPjyH2gFhIzdP2n2Sx5GGJrx8Muj7QNT/kYJz/VpXsXR809TidTQOXi3ejRc774lv27wYCVNHWzX0caLL9XvcdQLHHc0Ch2Xx8b0pE693QHb1RFaaQTGtrmKJSeNcwaDSTF8u+lLRW7BJdd4bfQAgmm189MbZzGU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sStwbHzN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sStwbHzN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so52832795e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790789611; x=1791394411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+ILzIid3gZMKSRINTnt4WslPGttrFKh3IKqGQ6yogE=;
        b=sStwbHzN1Ba+eIMvoYA2kpOL1Gq6KVLEVIXwKg4DLQvNoabtSfIUmIHmg6B9VHAQgc
         c2iIYADozcO4HgmWDtQ8x8m1R/mA+h3DHpQce1+rGy1mhgJy7Bvj3QuVG2sm1frdxrBW
         mus3C4spGqtssLgfYafdCeRwihW5q3DXgPqdlMmQtsRqsylpwDJikfWmnWvstR/Dj+Zb
         vTAxtBcwRv0DcfrbCZGrPc77KEKQGNcjdW1KHnJW6vJLLtUFbbbLxDXNDLwrT/FA0ioy
         mozQUXu75CGcOll26yxLHkwrA1Ix7g+5kG+CrzZAOnMKp9i1hOnmOB3zWkk9xYFE6Yo6
         ZswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789611; x=1791394411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+ILzIid3gZMKSRINTnt4WslPGttrFKh3IKqGQ6yogE=;
        b=dBTIPcyT0PVNzTsOkKEQXiLLplyIq0jMSEjD5fEGo+x8hdwKi1xmBhSeDl1ONz0dDe
         M+ooWszzryBEGSbq3DflWhvQBYo/tHYTnkxhBhLbvs9egVBWVAg6lIpVkUsYysKSG/mf
         jtPQtlf8NvcDNejecMjhqYfjPd4yxabHmKmQReeAqNjGz4HB0Co3cHA2yfIku1bS6SwC
         W2XN0rnhhK0dW1o+20kBAdbaxGxOVKJtLUKxIao/USoOJ1Ut0IBIwWmnTo+90jV1tlSN
         GmhneFOtFTG25tGia4vLHItAAla4g8Dfaxdf+0uf0m6QawNHVWJAmt6N2+bAoAJTvzGb
         IcMg==
X-Forwarded-Encrypted: i=1; AKwUvBydjH+2XZFl3HtLvz1r5rAhUv3ktH2Q2DGipvZNohz0xNdh2Q0GPCgTvziX7LZ8/1O/F1Bm4XSF14nCPSPOjEpptWvwTw==@lists.linux.dev
X-Gm-Message-State: AFuF++k6pGIWsUM3sgf0bJRl47wHvL/fTWonvcjjQRojLRxBZMJQEYwg
	BZBkv3ZqvfU8pA5ih1LTcI1MFfbmaiefMsg4J+cDe+KIhlSu4Z6mwLD8
X-Gm-Gg: AYBFou2wuKXfMLbTLwrXcj4bj+mxHzBgyLgBHl8xcjvplhR4D/cEzbdaxQcxRp7OV9d
	Bz+T7iio4SkOBeY0PhOMqyPLoRYwGC58hpP6sS5/2cLM99WsY2fKdJL65FjNh1f60ohlFlkmSJ/
	q602DCdOfdTuW929X+9CVsH26Tb7kKfES1gzci3x/6AZQirSHO8cdCujf5uzoX7fKhu0pRaEukb
	gg89bFfGp+135CTGIwn532U/934mAWhypPDe0pzKYKH7+MZxX8lRElSJYwmDa2szHthvuWYSehj
	rFu3hShEyuaiTKxA2G3wyqtjqx6pre8eG0ykeQGkSICwpcNRiwzYxK7vxOVE7YER6XaaXeCtljj
	NznxqMrfL5kwpDLgrRaOSD8hVyLBQfvln0/NlQUO+Hp/zEQzf2IxBc6Imq0niQOT8B3Fy1wXhUf
	Gc7rtPLA5nNeQZDo01xlSON7tODQfbXI8qEurB+0vRKsww3FqtZpn0tKqZFqkLANgpCbpnsfuGS
	eEfBuZgd23ErfYItS9sFb4ppP7AnXqr25nl9rVgmELYwia6iJuSV8skdCxbemq1TBo=
X-Received: by 2002:a05:600c:a10a:b0:4a0:1c16:d6f6 with SMTP id 5b1f17b1804b1-4a01c16d8bfmr24449495e9.24.1790789610840;
        Wed, 30 Sep 2026 10:33:30 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690d284sm492771f8f.17.2026.09.30.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:33:30 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	linux-fsdevel@vger.kernel.org,
	syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com,
	kudo3228@gmail.com,
	Mateusz Guzik <mjguzik@gmail.com>,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: Re: [PATCH RESEND] romfs: reject directory entry chains that do not move forward
Date: Wed, 30 Sep 2026 18:33:28 +0100
Message-Id: <20260930173328.79017-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <34t4huzelgho3zelar7vp332rwerth7nso6e76jrfced4chtrt@7q2cjbeymwov>
References: <20260918164645.9230-1-raghunathpalla.0209@gmail.com> <34t4huzelgho3zelar7vp332rwerth7nso6e76jrfced4chtrt@7q2cjbeymwov>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 11:58:35AM +0200, Jan Kara wrote:
> I doubt these bugs have any practical relevance so I wouldn't CC stable.
> But I guess that's for Christian.

Fair enough. I'll drop the stable tag if there is a v2.

> The patch looks good, I'm just not sure we are guaranteed ROMFS directories
> are indeed following monotonically increasing disk offset (although that's
> the most logical thing to do) - added Dave to CC for that.

Thanks for the review, Jan.

Documentation/filesystems/romfs.rst doesn't state it, but genromfs
always lays directories out that way. processdir() hands each entry the
current offset, which only ever grows, and it places a subdirectory's
contents straight after the subdirectory's own header, before the next
sibling. Entries are added to the directory list in that same order,
and dumpnode() writes each next pointer from that list, so within one
directory every next pointer points forward. I don't know of any other
tool that builds romfs images.

If you'd rather not rely on that, I can bound the walk by the number of
16-byte header slots in the image instead. That stops a cycle without
assuming any particular order. Happy to send a v2 either way.

Thanks,
Palla
