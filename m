Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6486A4690
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 00:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707870720; cv=none; b=scyPPU3yek6dJkJ/BD9Phz3l8H/j5xTlkqx+vafnK5THhupQJ6CWmKyxijVK6OMyoivsurxbKiUsQ8l0orz7/+q2Y0eAVh54a9+utMYacRcGAYia+VrtdfxFYCZNzE9al3+xiIiqlvDRbU2u20cdqIpK+UMOfMvsia3o4+8B6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707870720; c=relaxed/simple;
	bh=QOITHjTga42hAflI40Ipbts+6T7yutOW1a81G6BTQgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/4Gp9gDNrnRmpYWw/L5NPvOH+jgM84G6vh7gtjpnzKrqnue7Cxf4yhBxdplAbcP5Opa2FidjFapD5Me0WODCa8a5Hl8qwXs5yxsHkOZY1mgX/n8kcMNKiu/ilooIQ9hc4DJu5BCaJ1EAyrzxO8NlFm3p7JNOxZUA3qOwZhu03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Od8LPD4X; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Od8LPD4X"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFE51414E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 00:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLmnwR60x-F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 00:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=justinstitt@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DEDB5414CC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDB5414CC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Od8LPD4X
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DEDB5414CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 00:31:57 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so7849728a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 16:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707870715; x=1708475515; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTLJH4nKUhzssrfYYFDWlc0Q3VkrPFVldyClGOqfMTE=;
        b=Od8LPD4XlAk+kUrRXfaaR9xQpntaP7JWKiJRGkCrcQO9+JiWlOlug8TCLIO8JrX6fQ
         7SgQAAKEBN/tCyGfMWxtS4PZP7Ko5eVg3PDTlHbbc5puYiTOOlzw5Las3oWq9nfAQmlz
         AIMDHY8OT+C5UY/RLQH5CQc96P6jN3+WcZTdBqKfGkpqqSsSWY82Z9kAoWkiYLZjUC8J
         3+uvjN6tMnEgo3nWdNFeLId7kQVyn4q4Xrkd5lYWWAb+pa8b08KkM6SWKmJO+r+aXpPt
         bVsRrlCqbkBQqURH1SWxsnnvQNdtoerNBps56FLZx9Tbx3hO/tenl/kSqbEuW/NerRe/
         DuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707870715; x=1708475515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTLJH4nKUhzssrfYYFDWlc0Q3VkrPFVldyClGOqfMTE=;
        b=FG4W4MCihRpMZ/3iJeg0l/XfVU57hEwrAvyY7y2Cg9z9IX89iqw9kxdj6tPmhUJnPi
         UUMiC8vlhpX5LjA+EnXBYAV3QryBhpgLz7mrhj+tSg9h6GfqqQATgseBe2fKTLasVhQE
         bL38N2vvfhkvGdoVb2qkjulD5d0/U8UBGuhnD1w95bFseSjt5Y0uhb0rNaba1KzLwhKY
         oQIWfDPS1/mOL/1QKnAqCuZr03GACzBfffHnIhi06ckl637cCCw3SGSgjhs1O0IX9+9f
         NjF9eeEdMMU6kAfop39aoXMqqjTCFgNggnVbWoWyscjPoT6Aazs72WyON0uRsTznUPQZ
         kQCw==
X-Forwarded-Encrypted: i=1; AJvYcCXTVDpd/e1sVSSyOhdZXQO8v/q+0WH77nn8AgXN0CPWg/fonSfBYVGSkp2GvqioonaqvZ94+dM6tvf/LyuzpqsODyOqe/62jhLitYjUD6o3JUIGZrIOf1EKVQM0c9Q/
X-Gm-Message-State: AOJu0YwhpHESxyWgj+Peh9xdZHCeyGOwUGgyoZprAFa6ZGp3H5NW9+xd
	tDepsVxSQa/oGrvW6SYZfLADZ1NRBols5cX80kPWXtpkAHAa5U/EGBkkjuUF+6IwnWdA4kIp2EA
	my/BkLAs3pbIPiZNPMcYnwJWYXlX30ont528n
X-Google-Smtp-Source: AGHT+IEtxrlAsAa9Q4ABaPzKYYZ7PeY703iUnusW6WDgntH1FFpPpJ1MY7i6BNKNdf7i4Duf3v/vA4f6NUFZRLDsZTM=
X-Received: by 2002:aa7:d3c9:0:b0:561:123f:a98f with SMTP id
 o9-20020aa7d3c9000000b00561123fa98fmr694626edr.24.1707870715624; Tue, 13 Feb
 2024 16:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
 <20240213022552.754830-1-andrewjballance@gmail.com> <ZcvKQ3SpLNR9RfIe@bergen.fjasle.eu>
In-Reply-To: <ZcvKQ3SpLNR9RfIe@bergen.fjasle.eu>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 13 Feb 2024 16:31:42 -0800
Message-ID: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Andrew Ballance <andrewjballance@gmail.com>, masahiroy@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com, 
	nathan@kernel.org, ndesaulniers@google.com, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 12:00=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu>=
 wrote:
>
> On Mon 12 Feb 2024 20:25:52 GMT, Andrew Ballance wrote:
> > with python 12.1 '\#' results in this warning
>
> funny typo: it's Python 3.12 :)

They probably meant Python 3.12.1 and forgot the "3." (or had a vim
moment resulting in its unfortunate removal)

>
> Kind regards,
> Nicolas
>
>
> >     SyntaxWarning: invalid escape sequence '\#'
> >
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > ---
> >  scripts/clang-tools/gen_compile_commands.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clan=
g-tools/gen_compile_commands.py
> > index 5dea4479240b..93f64095fda9 100755
> > --- a/scripts/clang-tools/gen_compile_commands.py
> > +++ b/scripts/clang-tools/gen_compile_commands.py
> > @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, fi=
le_path):
> >      # escape the pound sign '#', either as '\#' or '$(pound)' (dependi=
ng on the
> >      # kernel version). The compile_commands.json file is not interepre=
ted
> >      # by Make, so this code replaces the escaped version with '#'.
> > -    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '=
#')
> > +    prefix =3D command_prefix.replace('\\#', '#').replace('$(pound)', =
'#')
> >
> >      # Return the canonical path, eliminating any symbolic links encoun=
tered in the path.
> >      abs_path =3D os.path.realpath(os.path.join(root_directory, file_pa=
th))
> > --
> > 2.43.0
> >
>
> --
> Nicolas Schier
>
> epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
> =E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
>      -- frykten for herren er opphav til kunnskap --
