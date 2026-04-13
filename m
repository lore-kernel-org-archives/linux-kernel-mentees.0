Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9323A561
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066854; cv=pass; b=s/NMs2mzMDagawoj+/I2azeT9Tf2CQOT0w2CchuHfA9FfYSrx+/j+bF27lkq5Q3btZvToFCiolkkVQ+S9yEtP0QjPDJEu5faG7207HBJOXViwUKsYVACVHnTwpfRyuccqJg/ybLui/EVj4dnJkpFF/f0T4fGBXv35QcgeHV6YwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066854; c=relaxed/simple;
	bh=BwLGd857a8/Gr8I9fhUqP7Q69S/w4GejNer6yC2hMY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b84FjwFiXFYnYS+toNyBwNyNniPqemurhWuadfqxwiVQNhzlCo66TISIlACdhPVmJ3uS0SpLP9ozqzzjYJOv/VA3RiEAZL3k/vtDS+I6Qb3PH2WSpqSmtHeCtj0VIRpH+rQ/MQGvzD0NxD1ivKC2QBKZ9ECt1mjrwcXgYvfTfp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCQDBjH5; arc=pass smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCQDBjH5"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED1854259E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6ee7HIvJv90 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Apr 2026 07:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15029424D0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15029424D0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oCQDBjH5
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 15029424D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:54:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b9c9d03524cso483384566b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 00:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066850; cv=none;
        d=google.com; s=arc-20240605;
        b=eoxBtDIZCHMG5ez3qWsRyxa9ICpQxMgaN40NeOvnN/Q+oufw3JJP/V8g2uA6xdVkM5
         j2DVPkApTZ8IXSN+9Ytk0cel7rFnxa+ESeQUgKDwFxt3aeUThC0sszM2Vx6kAnLvPDkg
         ZZee0xfXp9C09hKU2P+lkw+YDZN2IhdkxVX9PegptdahEnHtLCVGHZ2UnH77gamLE3N4
         biYE9Q6fxXvVA6JqVWl6BnjDVrWY9zrmtIKOcanh8pwKIrl1gg5zlK/Vdwb9mHbE9V5i
         qWieyNkzhntry5JvAiaIR516CgPWdx6DGrFUkyVeUsLDtBYC92ahHHxDYdb/v/+M5E8A
         sIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WF2eIKkja7dyHhJJwMsSuEwqCgvKiY7IvupflJtjz2Y=;
        fh=jwal7UVsv6J54gcVPpQfee/r0yCQEwwQggHPbmHxvxY=;
        b=hAMdQlGSaLO+q+H/DKqOz3RLfsa8AvyHMduCEaFc/qWWqWiXI4dlF8m4N7nVUA8XkY
         dAXkGMcLFEZ9stocvMToqu0GP2svZGh/5koFg/vR7a5knE9E5/tUHHlicQV5F7h9zgnP
         TjKzMlEfl9LfYRUiR/vMiGEvtK+4pFtnqEeLfMKkj+thL18Qo1c3spVpx9l+z26iBmpG
         tEJFfdKCV0nj4AAbKOW7EOsWZtOxs5+FwL/iSYmvmHghroEXX1rWlYESNDZI61Z/QQ6S
         vmnV/u21QTQAzHJoXuDTDuuiYJFA03fbWZl4tOg65dkRqvjH5NbuvWWent4sBDXDz8lj
         dt+g==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066850; x=1776671650; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF2eIKkja7dyHhJJwMsSuEwqCgvKiY7IvupflJtjz2Y=;
        b=oCQDBjH5fEipVERuwpgPFZdwyAIK/Q+yjB1Kdw9HqO5FRiHI6BW4LZVKsSgd/yEC9u
         Q0uFPQ+MLf1ghP5x7Y8TXdbZuFiZ94pTVKXnddLQIIrAi5kZTtZMIx/NTDUP9QS03/LI
         wyl2V5V+x4kJlIerlPfTGGRJaJmUCFw4gEE/wWqcyssuQjGz17e+n2wpiVZh630mSPm4
         BCPtsVtkTW84e/nhn352cpDpBLpmNLiSYtvcjX5oi2fGNx4YebkJdmMqUH3CrWj4VHWQ
         +PGXU3aU1y97+aDRTojnLieBpf37trfZrSdGpEch5bY91xwW9xmOulroIwqWt/aDT0qd
         IjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066850; x=1776671650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WF2eIKkja7dyHhJJwMsSuEwqCgvKiY7IvupflJtjz2Y=;
        b=ounkPU2sjBFG7z06kw9ueB9HrgvlwtkZg/u3cCaPtsQyqlu1hWHKgRH7BNE/CkE2en
         gcHWPU+qXuDnZbtbRJi2MQpd1ofpyjK83hhpug035WfRn9L6I+nhVV+7s24zME2YeJ/h
         C62EKprGV6NGcXjvSWvD9pF9wR4A1ovjD6oQUQnCaODsY5B/66+yrpns7gp82AN7HW7I
         FEmLZ1w5e7tSNUUOsk0DJdrjNIYFTUeJ4QF1BFT+5m1HASe+OVy5rvIXNym8RA/9IaNs
         5YlFEGkXWUNQxfw1GvuYaaOzgURr0Rjsvj0T9vSDYHe2ssQE3Y3EAt1/19LKKY0qHhkJ
         Uqdw==
X-Forwarded-Encrypted: i=1; AFNElJ9rrVIwZyZjlhgjVXTI7RMcu80u44oIFbGfTa3tSmti4onia1BrYq2GBohSNmD0hZTQpya53LZiSOyNoONuuE3GbNtC3Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxIirIt4XkTafs+uXJShfdW+He4Co89p/YT1pkn5XM16YNvyK9n
	Un0oZu7WBj9vT+A8gyOkV0Lv9KW7hPZEDoNCBpusPviKDegKu707b0Ec2cNWdfDD1AXNg/iPEj2
	EEqlsVBbaaZTjreYxJ0lqRZ6EAigAGJw=
X-Gm-Gg: AeBDiev3sEmijHx/4yqmKYfREJf9nzJpK7zA0ldIYLLHSpvMkFUyfYOV2ZjB80TEfr/
	oGU+WVa+v7ibpGSNxylxBhjljmAS/w84YDQmaxchlnTlBR1l911429ggFMOTfY8pQFFnc3ih4iT
	YN3vuXLh3YnT7p+kkCiwGxOxA7wThG2KeWkqyZOHyx2y0K80VExrE4BNynKDZ1OZVL4g1WbUuBa
	2Rjm2zXV8+2cXJeJAh8C8dfZX2lpF+npqr+n3Rj+iE7I7w2eFDskVGy8H+E6lwMgYg58F0n4j/S
	zTaMcSGg7x839E042LkxfVsed/VihMuGfhIgxue5UOSv5VEE56D+Gsg2NdhQJqVVvzKx3XzGPuB
	YWTb6Gxw=
X-Received: by 2002:a17:907:9615:b0:b98:6984:6627 with SMTP id
 a640c23a62f3a-b9d729c0986mr635516166b.40.1776066849676; Mon, 13 Apr 2026
 00:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
 <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com> <adygIkRhnsGv-LwM@stanley.mountain>
In-Reply-To: <adygIkRhnsGv-LwM@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:53:32 +0300
X-Gm-Features: AQROBzCmapfAP5XxJL0BZHSYMWhRjgPMxX-DCGpXJHZVAmXSTow49ekBVs85ec0
Message-ID: <CAHp75VcZU21syEY7rx9BsvckKq-Tic259xPghetPad-gY7kDng@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Use %pe format specifier for error pointers
To: Dan Carpenter <error27@gmail.com>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 10:49=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
> On Mon, Apr 13, 2026 at 10:03:58AM +0300, Andy Shevchenko wrote:
> > On Sun, Apr 12, 2026 at 5:46=E2=80=AFPM Mahad Ibrahim
> > <mahad.ibrahim.dev@gmail.com> wrote:

...

> I always like these changes.  I wish that there were an equivalent
> %e which printed error codes that weren't stored in an error pointer.
>
> KTODO: introduce a %e type format thing which prints error codes

Never happens until it becomes a C standard.


--=20
With Best Regards,
Andy Shevchenko
