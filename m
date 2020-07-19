Return-Path: <SRS0=eJeJ=A6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FA7C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 07:13:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7540520734
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 07:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHA0o2OT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7540520734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B07787C0D;
	Sun, 19 Jul 2020 07:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pq6WGpfahLKG; Sun, 19 Jul 2020 07:13:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60E8D87B3D;
	Sun, 19 Jul 2020 07:13:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 536FAC0890;
	Sun, 19 Jul 2020 07:13:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEE67C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 07:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 965CE86499
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 07:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzAGDl1n806q
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 07:13:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59AE286094
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 07:13:20 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id x9so10690107ila.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ockTlsBJ+BaCpkvYTXRvNAITeP0khz/oeG6KFqTrLjA=;
 b=VHA0o2OTvdZ7ukQLGNWCnPyDNE8QwIocrhx1pQNkCAVLblwMvdwJjMlZd53rEDbWJP
 cfsoNBdsA8pWRh0pPMBy4TSn2e1GO+BjKroeqzPkee9g863I4jxoq32znkaWUcvAZTrC
 mS6ZizIdXlEphIXUWpC5t5fR6IOTWPQWHQ1iZGbaF/BZEWeAuJOEVM9UP7iGjOcDeDj5
 3zJGGMjP6WcirIK/x9bUSKyfeVkdhINNs+FWXsqFxZv1/72M6JfEcGIzcR7nT+6a2SRC
 +Sjy3Sp7GsxBqWI5jVXXdLe7ZVrHJyPrski3W1aUMKmLvJpIvRLSQi2DhRkngSnSr7uc
 W4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ockTlsBJ+BaCpkvYTXRvNAITeP0khz/oeG6KFqTrLjA=;
 b=LY2Af9EL/0wSlDCwULgPaPeF8rZOD//qAfmZw5WBpAyLRiXe7rI8J9ZjW8MzXBvaIe
 Mr+YcW6arifoPXzgyGles5ecJOOzXzjghphB9RJtaaoMPi1Jiamm+JazHBeQn7Vx14Ux
 ofPjDA0h1cmOuNe/LhzLWkyZWbPiMyoOzadyDb0mYKuTUAlDiyCjG25j//CKUHO36psL
 g6PhyfspAAO4XyKPiug8gEYnU4wLIEiKIGbCupjUOlDY6VwugWQyHbN2nBdjB7Fo+LLx
 KKp4tIGxDHrJwyCh9KTihKlb0cSqnzNM4Mdo/xfG4k4ePBGVfFmAKJTnrA6jl76/Nv4I
 m7Ow==
X-Gm-Message-State: AOAM530Qt/mPztiqPh9oS3suTlA9SrXGXJIafIaKr79uIvKQHF1lRhIh
 FxSqVoI09YTCdPZ4b8QzEFIRjgLsESTNBafodz8=
X-Google-Smtp-Source: ABdhPJyyZaPZ+8pnHkuJd/H5TPGvqYKU3YFfVIzBOSXvyo5V50qjwwDdi3ncurRgqTcswPo6bKiGIwx7R0HNAWuDteM=
X-Received: by 2002:a05:6e02:11a6:: with SMTP id
 6mr16632518ilj.64.1595142799553; 
 Sun, 19 Jul 2020 00:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
 <alpine.DEB.2.21.2007132140160.11844@felia>
 <CAD1=X6ktktiJ10f3sefs72_WfWLFEVUg85mvp9391=tsn7gULw@mail.gmail.com>
 <alpine.DEB.2.21.2007140748230.6558@felia>
 <CAD1=X6=7hdMviayOxwa9runHuKCU5ShmFnM+pzLzEsM_-D0dzA@mail.gmail.com>
 <CAKXUXMxE=cFDeSbAAAE+Thy1P6KBHmD3Gh99wAh-jheXQNKT8w@mail.gmail.com>
 <CAD1=X6=rxtVDWFQ05daFV+saLz9eG3g-UpAbqFf-kG848idn9g@mail.gmail.com>
 <CAKXUXMx6x=5bx0xOa0zv9qUHfv8z_3TTgphRy9gPBaUg+oZZsA@mail.gmail.com>
 <CAD1=X6=tR5OgHvgxR_XEVoEUNDLKyB1Nse0qFzhFZ=gtND_4zw@mail.gmail.com>
In-Reply-To: <CAD1=X6=tR5OgHvgxR_XEVoEUNDLKyB1Nse0qFzhFZ=gtND_4zw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 19 Jul 2020 09:13:06 +0200
Message-ID: <CAKXUXMyUpUP73U9KhV0S39sUsMcfTDDu3m7acC2VMeXjvfV-dg@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7305596902887632106=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7305596902887632106==
Content-Type: multipart/alternative; boundary="000000000000eefafa05aac61f52"

--000000000000eefafa05aac61f52
Content-Type: text/plain; charset="UTF-8"

On So., 19. Juli 2020 at 08:28, Mrinal Pandey <mrinalmni@gmail.com> wrote:

>
>
> On Fri, Jul 17, 2020 at 5:18 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
>
>>
>>
>> On Fri, Jul 17, 2020 at 11:54 AM Mrinal Pandey <mrinalmni@gmail.com>
>> wrote:
>>
>>>
>>>
>>> On Thu, Jul 16, 2020, 11:01 Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>> wrote:
>>>
>>>>
>>>>
>>>> On Thu, Jul 16, 2020 at 7:15 AM Mrinal Pandey <mrinalmni@gmail.com>
>>>> wrote:
>>>>
>>>>>
>>>>>
>>>>> On Tue, Jul 14, 2020 at 11:33 AM Lukas Bulwahn <
>>>>> lukas.bulwahn@gmail.com> wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On Tue, 14 Jul 2020, Mrinal Pandey wrote:
>>>>>>
>>>>>> >
>>>>>> >
>>>>>> > On Tue, Jul 14, 2020 at 1:16 AM Lukas Bulwahn <
>>>>>> lukas.bulwahn@gmail.com> wrote:
>>>>>> >
>>>>>> >
>>>>>> >       On Mon, 13 Jul 2020, Mrinal Pandey wrote:
>>>>>> >
>>>>>> >       > In all the scripts, the SPDX license should be on the
>>>>>> second line,
>>>>>> >       > the first line being the "sh-bang", but checkpatch issues a
>>>>>> warning
>>>>>> >       > "Misplaced SPDX-License-Identifier tag - use line 1
>>>>>> instead" for the
>>>>>> >       > scripts that have SPDX license in the second line.
>>>>>> >       >
>>>>>> >       > However, this warning is not issued when checkpatch is run
>>>>>> on a file using
>>>>>> >       > `-f` option. The case for files has been handled gracefully
>>>>>> by changing
>>>>>> >       > `$checklicenseline` to `2` but a corresponding check when
>>>>>> running checkpatch
>>>>>> >       > on a commit hash is missing.
>>>>>> >       >
>>>>>> >       > I noticed this false positive while running checkpatch on
>>>>>> the set of
>>>>>> >       > commits from v5.7 to v5.8-rc1 of the kernel on the commits
>>>>>> which modified
>>>>>> >       > a script file.
>>>>>> >       >
>>>>>> >       > This check is missing in checkpatch since commit
>>>>>> a8da38a9cf0e
>>>>>> >       > ("checkpatch: add test for SPDX-License-Identifier on wrong
>>>>>> line #")
>>>>>> >       > when the corresponding rule was first commited.
>>>>>> >       >
>>>>>> >       > Fix this by setting `$checklicenseline` to `2` when the
>>>>>> diff content that
>>>>>> >       > is being checked originates from a script, thus, informing
>>>>>> checkpatch that
>>>>>> >       > the SPDX license should be on the second line.
>>>>>> >       >
>>>>>> >       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
>>>>>> >       > ---
>>>>>> >       >  scripts/checkpatch.pl | 3 +++
>>>>>> >       >  1 file changed, 3 insertions(+)
>>>>>> >       >
>>>>>> >       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>>> >       > index 4c820607540b..bbffd0c4449d 100755
>>>>>> >       > --- a/scripts/checkpatch.pl
>>>>>> >       > +++ b/scripts/checkpatch.pl
>>>>>> >       > @@ -3218,6 +3218,9 @@ sub process {
>>>>>> >       >               next if ($realfile !~
>>>>>> /\.(h|c|s|S|sh|dtsi|dts)$/);
>>>>>> >       >
>>>>>> >       >  # check for using SPDX-License-Identifier on the wrong
>>>>>> line number
>>>>>> >       > +             if ($realfile =~ /^scripts/) {
>>>>>> >       > +                    $checklicenseline = 2;
>>>>>> >       > +             }
>>>>>> >
>>>>>> >       I think this is somehow wrong here. The check for
>>>>>> checklicenseline = 2
>>>>>> >       looks very different above.
>>>>>> >
>>>>>> >       Why does -f work and using a patch file not work?
>>>>>> >
>>>>>> >
>>>>>> > Sir,
>>>>>> >
>>>>>> > I am going to explain my observation based on file
>>>>>> `scripts/atomic/gen-atomic-fallback.sh` and
>>>>>> > commit hash `37f8173dd849`.
>>>>>> >
>>>>>> > If we are checking against the file, `checklicenseline` is set to 1
>>>>>> and when `realline` is 1 the above
>>>>>> > `if` block is triggered, then we check if this line is of the form
>>>>>> `#!/` using the regular expression
>>>>>> > `^[ \+]\s*\#\!\s*\/`. If this is the case we set `checklicenseline`
>>>>>> to `2` informing checkpatch that it should
>>>>>> > expect license on the second line and this works all fine for a
>>>>>> file.
>>>>>> > The `if` block below my proposed changes evaluates to false in this
>>>>>> case and thus it emits no false warning.
>>>>>> >
>>>>>> > However, If we are checking a diff content, the above `if` block is
>>>>>> not triggered at all. This is
>>>>>> > because `realline` stores the actual line number of the line we are
>>>>>> checking currently out of diff content.
>>>>>> > This value is 2 because SPDX identifier is indeed at the second
>>>>>> line in the file but `checklicenseline` is still
>>>>>> > `1`.
>>>>>> > `realline` will never become equal to 1 again and thus the above
>>>>>> `if` condition will never be true in this case.
>>>>>> > Even if the above `if` block is triggered it would not update
>>>>>> `checklicenseline` to 2 as the regular expression
>>>>>> > is not satisfied since we don't have sh-bang in diff content and
>>>>>> just the SPDX tag.
>>>>>> > If we don't do this, the `if` block below evaluates to true when
>>>>>> `realline` is 2 and `checklicensline` is `1`
>>>>>> > leading
>>>>>> > to the emission of a false warning.
>>>>>> >
>>>>>>
>>>>>> So, maybe this whole logic needs to be reworked. If you do not know
>>>>>> the
>>>>>> first line, you need to have a different criteria in the first place
>>>>>> to determine if you expect the license tag in the first or the
>>>>>> second,
>>>>>> e.g., the file extension, and then checking line 1 for a shebang is
>>>>>> just
>>>>>> sanity checking. If it is of a specific file extension, you know line
>>>>>> 1
>>>>>> and it is not a shebang, that is probably worth noting as a different
>>>>>> recommendation in checkpatch.pl anyway.
>>>>>>
>>>>>
>>>>> Sir,
>>>>>
>>>>> When we know the first line, i.e. we are running checkpatch against a
>>>>> file, the existing logic
>>>>> works fine. We probably don't want to induce any changes there.
>>>>>
>>>>>
>>>> Why not? Do you think we would break things there? Then we should not
>>>> touch the code at all.
>>>> Do you think we cannot test it properly after the change? Then we
>>>> should think about how we make a proper regression test suite for that.
>>>>
>>>
>>> Sir,
>>>
>>> No, breaking code or not being able to test is not why I suggest this. I
>>> feel that the existing logic handles the case of
>>> "Improper or malformed SPDX tag" and "Misplaced SPDX tag" for files i.e.
>>> when the first line is known. Anyway, the logic
>>> for "Misplaced SPDX tag" is written as a different rule. We just need to
>>> add in the logic for patches there.
>>> I tried to do this by checking for the scripts directory which was
>>> wrong. If I check instead for the file being a script that would make much
>>> more sense.
>>> Please let me know if you suggest something else.
>>>
>>
>> Well, you are going to add a different way of checking as you suggested,
>> right? So are you suggesting to have two duplicated ways of checking for
>> the same thing? That seems strange to me.
>>
>
>> Go ahead, make a suitable first proposal, then we will see if and how to
>> refactor.
>>
>
> Sir,
>
> No, I would not want to duplicate things. Yes, let me first send a patch
> to you first, and then we can refactor it if needed.
>
>>
>>
>>>
>>>> But when we don't know the first line, if am not wrong, it would go
>>>>> somewhat like:
>>>>> if (the file is a script) {
>>>>>     if (the first line is shebang) {
>>>>>         if (the second line is SPDX) {
>>>>>             All good
>>>>>         } else {
>>>>>             Issue a misplaced or missing SPDX tag warning
>>>>>         }
>>>>>     } else {
>>>>>             Issue a missing shebang warning
>>>>>     }
>>>>> } else {
>>>>>     if (the first line is SPDX) {
>>>>>         All good
>>>>>     } else {
>>>>>         Issue a misplaced or missing SPDX tag warning
>>>>>     }
>>>>> }
>>>>>
>>>>>
>>>> Basically agree, but that logic applies when you know the first line as
>>>> well (and only, right?). What if you do not know the first line, how would
>>>> you check "the first line is shebang" if you do not know the first line?
>>>>
>>>>
>>>> The missing shebang warning probably needs to go elsewhere in the whole
>>>> script.
>>>>
>>>
>>> By not knowing the first line I mean to say that the first line doesn't
>>> show up in diff content of the patch but
>>> what if we open the file at that point in the commit history and check
>>> for the first line to be a shebang?
>>> Would it be okay to do that? Once we check the first line we can then
>>> continue as suggested.
>>>
>>
>> I think that is essentially against the general design decision of
>> checkpatch.pl; checkpatch.pl takes the patch but it does not check
>> anything in the current working tree, nor does it know what the "parent" of
>> that patch in the git history really is.
>>
>> Maybe Shuah can confirm? Otherwise, I suggest to look if you find
>> checking a file beyond the patch happening anywhere in the current code of
>> checkpatch.pl and documented in the sparse documentation on checkpatch.pl
>> .
>>
>> So, I believe you need to make it work without checking the first line
>> (if that is not in the patch).
>>
>
> Yes. We can't open a file for checking, you are correct here but we need
> to check for shebang to be on the first line only if it appears
> in the diff content or when we check a complete file, otherwise, we should
> anyway not chek it since checkpatch only checks the patch or the complete
> file.
> Am I correct here?
>
>>
>>
>>>
>>>>>> > So, what I did was to check if the diff content we are checking
>>>>>> actually comes from a script, if yes, we can set
>>>>>> > `checklicenseline` to `2` to avoid this confusion.
>>>>>> >
>>>>>>
>>>>>> Why would you think that scripts are only in scripts?
>>>>>>
>>>>>> How about first listing all files where the SPDX tag is in line 2 in
>>>>>> the
>>>>>> current repository, e.g., v5.8-rc5?
>>>>>>
>>>>>> Then, we look at that list and determine a suitable criteria for
>>>>>> looking
>>>>>> in line 2 for the SPDX tag.
>>>>>>
>>>>>
>>>>> Yes, the scripts are not only in scripts. I have listed all the files
>>>>> where the SPDX tag should be
>>>>> on the second line. I've attached the list for reference. We should
>>>>> probably be checking the file
>>>>> extension to determine if the tag needs to be on the second line or
>>>>> not.
>>>>> The documentation says the SPDX tag should be present in all source
>>>>> files. Do these source files include
>>>>> Documentation files too?
>>>>>
>>>>>
>>>> How did you create that list?
>>>> Agree (if the way you created that list makes sense). File extension
>>>> seems to cover all cases, and checking for the directory 'scripts' does not.
>>>>
>>>> I issued the command `find . -regex ".*\.\(py\|sh\|pl\)"` to make this
>>> list. I should have included awk, YAML and tc files too since they are
>>> scripts too.
>>>
>>>
>> Why not look for all files that have a shebang in the first line?
>>
>
> We could be checking a file or a patch. I suggest we take the name of the
> file we are checking(or the name of the file from which the diff content
> comes from)
> and then run a regex, similar to above, on it to determine if it is a
> script. If we instead go for checking the first line to be shebang in the
> current file would it not require to cat or open
> the file?
>


All good. Create a patch and then we will see.

Lukas

>

--000000000000eefafa05aac61f52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On So., 19. Juli 2020=
 at 08:28, Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com">mrinalm=
ni@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><d=
iv><br></div><br><div class=3D"gmail_quote"></div></div><div><div class=3D"=
gmail_quote"><div class=3D"gmail_attr">On Fri, Jul 17, 2020 at 5:18 PM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com" target=3D"_blank">=
lukas.bulwahn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div><div><br></div><br><div class=3D"gmail_quote"><=
div class=3D"gmail_attr">On Fri, Jul 17, 2020 at 11:54 AM Mrinal Pandey &lt=
;<a href=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div class=
=3D"gmail_attr">On Thu, Jul 16, 2020, 11:01 Lukas Bulwahn &lt;<a href=3D"ma=
ilto:lukas.bulwahn@gmail.com" rel=3D"noreferrer" target=3D"_blank">lukas.bu=
lwahn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div><div><br></div><br><div class=3D"gmail_quote"><div clas=
s=3D"gmail_attr">On Thu, Jul 16, 2020 at 7:15 AM Mrinal Pandey &lt;<a href=
=3D"mailto:mrinalmni@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">mrinalmni@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><div><br></div><br><div class=3D"gmail_quote">=
<div class=3D"gmail_attr">On Tue, Jul 14, 2020 at 11:33 AM Lukas Bulwahn &l=
t;<a href=3D"mailto:lukas.bulwahn@gmail.com" rel=3D"noreferrer noreferrer" =
target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Tue, 14 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Jul 14, 2020 at 1:16 AM Lukas Bulwahn &lt;<a href=3D"mailto:lu=
kas.bulwahn@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">luka=
s.bulwahn@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 13 Jul 2020, Mrinal Pandey wrote:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In all the scripts, the SPDX license sh=
ould be on the second line,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the first line being the &quot;sh-bang&=
quot;, but checkpatch issues a warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;Misplaced SPDX-License-Identifier=
 tag - use line 1 instead&quot; for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; scripts that have SPDX license in the s=
econd line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; However, this warning is not issued whe=
n checkpatch is run on a file using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; `-f` option. The case for files has bee=
n handled gracefully by changing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; `$checklicenseline` to `2` but a corres=
ponding check when running checkpatch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; on a commit hash is missing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I noticed this false positive while run=
ning checkpatch on the set of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; commits from v5.7 to v5.8-rc1 of the ke=
rnel on the commits which modified<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; a script file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This check is missing in checkpatch sin=
ce commit a8da38a9cf0e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (&quot;checkpatch: add test for SPDX-Li=
cense-Identifier on wrong line #&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; when the corresponding rule was first c=
ommited.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Fix this by setting `$checklicenseline`=
 to `2` when the diff content that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; is being checked originates from a scri=
pt, thus, informing checkpatch that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the SPDX license should be on the secon=
d line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Mrinal Pandey &lt;<a hre=
f=3D"mailto:mrinalmni@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">mrinalmni@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 scripts/<a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">checkpat=
ch.pl</a> | 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 3 insertions(+)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; diff --git a/scripts/<a href=3D"http://=
checkpatch.pl" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">c=
heckpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; index 4c820607540b..bbffd0c4449d 100755=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --- a/scripts/<a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">checkpat=
ch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +++ b/scripts/<a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">checkpat=
ch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -3218,6 +3218,9 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 # check for using SPDX-License-Id=
entifier on the wrong line number<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ($realfile =3D~ /^scripts/) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $checklicenseline =3D 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I think this is somehow wrong here. The chec=
k for checklicenseline =3D 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0looks very different above.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Why does -f work and using a patch file not =
work?<br>
&gt; <br>
&gt; <br>
&gt; Sir,<br>
&gt; <br>
&gt; I am going to explain my observation based on file `scripts/atomic/gen=
-atomic-fallback.sh` and<br>
&gt; commit hash `37f8173dd849`.<br>
&gt; <br>
&gt; If we are checking against the file, `checklicenseline` is set to 1 an=
d when `realline` is 1 the above<br>
&gt; `if` block is triggered, then we check if this line is of the form `#!=
/` using the regular expression<br>
&gt; `^[ \+]\s*\#\!\s*\/`. If this is the case we set `checklicenseline` to=
 `2` informing checkpatch that it should<br>
&gt; expect license on the second line and this works all fine for a file.<=
br>
&gt; The `if` block below my proposed changes evaluates to false in this ca=
se and thus it emits no false warning.<br>
&gt; <br>
&gt; However, If we are checking a diff content, the above `if` block is no=
t triggered at all. This is<br>
&gt; because `realline` stores the actual line number of the line we are ch=
ecking currently out of diff content.<br>
&gt; This value is 2 because SPDX identifier is indeed at the second line i=
n the file but `checklicenseline` is still<br>
&gt; `1`.<br>
&gt; `realline` will never become equal to 1 again and thus the above `if` =
condition will never be true in this case.<br>
&gt; Even if the above `if` block is triggered it would not update `checkli=
censeline` to 2 as the regular expression<br>
&gt; is not satisfied since we don&#39;t have sh-bang in diff content and j=
ust the SPDX tag.<br>
&gt; If we don&#39;t do this, the `if` block below evaluates to true when `=
realline` is 2 and `checklicensline` is `1`<br>
&gt; leading<br>
&gt; to the emission of a false warning.<br>
&gt; <br>
<br>
So, maybe this whole logic needs to be reworked. If you do not know the <br=
>
first line, you need to have a different criteria in the first place<br>
to determine if you expect the license tag in the first or the second, <br>
e.g., the file extension, and then checking line 1 for a shebang is just<br=
>
sanity checking. If it is of a specific file extension, you know line 1<br>
and it is not a shebang, that is probably worth noting as a different <br>
recommendation in <a href=3D"http://checkpatch.pl" rel=3D"noreferrer norefe=
rrer noreferrer" target=3D"_blank">checkpatch.pl</a> anyway.<br></blockquot=
e><div><br></div><div>Sir,</div><div><br></div><div><div>When we know the f=
irst line, i.e. we are running checkpatch against a file, the existing logi=
c</div><div>works fine. We probably don&#39;t want to induce any changes th=
ere.<br></div><div><br></div></div></div></div></blockquote><div><br></div>=
<div>Why not? Do you think we would break things there? Then we should not =
touch the code at all.</div><div>Do you think we cannot test it properly af=
ter the change? Then we should think about how we make a proper regression =
test suite for that.</div></div></div></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Sir,</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">No, breaking code or not being able to test is not why I sug=
gest this. I feel that the existing logic handles the case of <br></div><di=
v dir=3D"auto">&quot;Improper or malformed SPDX tag&quot; and &quot;Misplac=
ed SPDX tag&quot; for files i.e. when the first line is known. Anyway, the =
logic</div><div>for &quot;Misplaced SPDX tag&quot; is written as a differen=
t rule. We just need to add in the logic for patches there. <br></div><div>=
I tried to do this by checking for the scripts directory which was wrong. I=
f I check instead for the file being a script that would make much more sen=
se.<br></div><div dir=3D"auto">Please let me know if you suggest something =
else.</div></div></div></blockquote><div><br></div><div>Well, you are going=
 to add a different way of checking as you suggested, right? So are you sug=
gesting to have two duplicated ways of checking for the same thing? That se=
ems strange to me.</div></div></div></blockquote><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div><br></div><div=
>Go ahead, make a suitable first proposal, then we will see if and how to r=
efactor.</div></div></div></blockquote><div><br></div></div></div><div><div=
 class=3D"gmail_quote"><div>Sir,</div><div><br></div><div>No, I would not w=
ant to duplicate things. Yes, let me first send a patch to you first, and t=
hen we can refactor it if needed.<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div><div class=3D"gmail_quote"><div>=C2=A0<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto"><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><div class=3D"gmail_quote"><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div>Bu=
t when we don&#39;t know the first line, if am not wrong, it would go somew=
hat like:<br></div><div>if (the file is a script) {</div><div>=C2=A0=C2=A0=
=C2=A0 if (the first line is shebang) {</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (the second line is SPDX) {</div><div>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 All good<br></div><div>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {</div><div>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Issue a misplaced or=
 missing SPDX tag warning<br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }<br></div><div>=C2=A0=C2=A0=C2=A0 } else {</div><div>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Issue a missing s=
hebang warning<br></div><div>=C2=A0=C2=A0=C2=A0 }<br></div><div>} else {</d=
iv><div>=C2=A0=C2=A0=C2=A0 if (the first line is SPDX) {</div><div>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 All good<br></div><div>=C2=A0=C2=A0=C2=
=A0 } else {</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Issue a m=
isplaced or missing SPDX tag warning</div><div>=C2=A0=C2=A0=C2=A0 }<br></di=
v><div>}</div><div> <br></div></div></div></blockquote><div><br></div><div>=
Basically agree, but that logic applies when you know the first line as wel=
l (and only, right?). What if you do not know the first line, how would you=
 check &quot;the first line is shebang&quot; if you do not know the first l=
ine?</div><div><br></div><div><br></div><div>The missing shebang warning pr=
obably needs to go elsewhere in the whole script.</div></div></div></blockq=
uote><div><br></div><div>By not knowing the first line I mean to say that t=
he first line doesn&#39;t show up in diff content of the patch but<br></div=
><div>what if we open the file at that point in the commit history and chec=
k for the first line to be a shebang?</div><div>Would it be okay to do that=
? Once we check the first line we can then continue as suggested.<br></div>=
</div></div></div></div></blockquote><div><br></div><div>I think that is es=
sentially against the general design decision of <a href=3D"http://checkpat=
ch.pl" target=3D"_blank">checkpatch.pl</a>; <a href=3D"http://checkpatch.pl=
" target=3D"_blank">checkpatch.pl</a> takes the patch but it does not check=
 anything in the current working tree, nor does it know what the &quot;pare=
nt&quot; of that patch in the git history really is.</div><div><br></div><d=
iv>Maybe Shuah can confirm? Otherwise, I suggest to look if you find checki=
ng a file beyond the patch happening anywhere in the current code of <a hre=
f=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a> and document=
ed in the sparse=C2=A0documentation on <a href=3D"http://checkpatch.pl" tar=
get=3D"_blank">checkpatch.pl</a>.</div><div><br></div><div>So, I believe yo=
u need to make it work without checking the first line (if that is not in t=
he patch).</div></div></div></blockquote><div><br></div><div>Yes. We can&#3=
9;t open a file for checking, you are correct here but we need to check for=
 shebang to be on the first line only if it appears</div><div> in the diff =
content or when we check a complete file, otherwise, we should anyway not c=
hek it since checkpatch only checks the patch or the complete file.</div><d=
iv>Am I correct here?<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div><div dir=3D"auto"><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; So, what I did was to check if the diff content we are checking actual=
ly comes from a script, if yes, we can set<br>
&gt; `checklicenseline` to `2` to avoid this confusion.<br>
&gt;<br>
<br>
Why would you think that scripts are only in scripts?<br>
<br>
How about first listing all files where the SPDX tag is in line 2 in the <b=
r>
current repository, e.g., v5.8-rc5?<br>
<br>
Then, we look at that list and determine a suitable criteria for looking <b=
r>
in line 2 for the SPDX tag.<br></blockquote><div><br></div><div>Yes, the sc=
ripts are not only in scripts. I have listed all the files where the SPDX t=
ag should be</div><div>on the second line. I&#39;ve attached the list for r=
eference. We should probably be checking the file</div><div>extension to de=
termine if the tag needs to be on the second line or not.</div><div>The doc=
umentation says the SPDX tag should be present in all source files. Do thes=
e source files include</div><div>Documentation files too?</div><div><br></d=
iv></div></div></blockquote><div><br></div><div>How did you create that lis=
t?</div><div>Agree (if the way you created that list makes sense). File ext=
ension seems to cover all cases, and checking for the directory &#39;script=
s&#39; does not.</div><div><br></div></div></div></blockquote><div>I issued=
 the command `find . -regex &quot;.*\.\(py\|sh\|pl\)&quot;` to make this li=
st. I should have included awk, YAML and tc files too since they are script=
s too.</div><div><br></div></div></div></div></div></blockquote><div><br></=
div><div>Why not look for all files that have a shebang in the first line?<=
/div></div></div></blockquote></div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">We could be checking a file or a patch. I suggest =
we take the name of the file we are checking(or the name of the file from w=
hich the diff content comes from)</div><div class=3D"gmail_quote">and then =
run a regex, similar to above, on it to determine if it is a script. If we =
instead go for checking the first line to be shebang in the current file wo=
uld it not require to cat or open</div><div class=3D"gmail_quote">the file?=
</div><div class=3D"gmail_quote"></div></div></blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">All good. Create a=
 patch and then we will see.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Lukas</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=
=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
</blockquote></div></div>
</blockquote></div></div></div>
</div>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div></div>

--000000000000eefafa05aac61f52--

--===============7305596902887632106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7305596902887632106==--
