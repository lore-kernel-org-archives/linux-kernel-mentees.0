From: skhan@linuxfoundation.org (Shuah Khan)
Date: Fri, 28 Jun 2019 09:27:31 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] nl80211: Fix undefined
 behavior in bit shift
In-Reply-To: <b5a247aa3bb21094c0a6ef1d8e3281d701bb6200.camel@sipsolutions.net>
References: <20190627010137.5612-4-c0d1n61at3@gmail.com>
	<20190627032532.18374-4-c0d1n61at3@gmail.com>
	<c20a0a94-ab50-bb85-7c78-e02a465c5a40@linuxfoundation.org>
	<8b8c44c3ecb8626d9bb5a8f786b1d2b7488df86b.camel@sipsolutions.net>
	<9e17c585-bd42-8c65-a37a-add6aa4d5ca4@linuxfoundation.org>
	<b5a247aa3bb21094c0a6ef1d8e3281d701bb6200.camel@sipsolutions.net>
Message-ID: <551305fd-bb35-7f9d-0243-ada0a8400074@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190628152731.Prb8epViDzhdhGG7lfl24HAFcygR3frpQlBTRU9W6P8@z>

On 6/28/19 9:17 AM, Johannes Berg wrote:
> Hi Shuah,
> 
>> I went looking in the git log. Looks like there are several commits with
>> "Changes since" included in the commit log. It still appears to be
>> maintainer preference. Probably from networking and networking related
>> areas - wireless being one of them. This trend is recent it appears in
>> any case.
> 
> Yeah. I was really just observing that I'd seen this, and some people (I
> guess 'many' was an exaggeration) actively request it to be in the
> commit log. I "grew up" with "changelog after ---" too ;-)
> 
>> There is a value to seeing changes as the work evolves. However, there
>> is the concern that how log should it be.
> 
> That doesn't parse, what did you mean?

Say we are on version 16 of a patch series, when does the commit log
become too long to be useful?

> 
>> This example commit has history from RFC stage and no doubt very useful
>> since this is a new driver.
>>
>> 8ef988b914bd449458eb2174febb67b0f137b33c
>>

This commit has a very long commit log starting from RFC stage. It is
very informative.

>> If we make this more of a norm, we do want to make sure, we evolve
>> from informal nature of these "Changes since", to "Commit log" text.
> 
> Not sure it's really worth it, but I guess some recommendations could be
> useful. If it is indeed to become the norm, and there aren't some people
> who strongly feel it should *not* be included.
> 

Yeah. If it becomes a norm, we probably will have to set some limits how
long, and reads like part of the commit log as opposed to something
slapped on at the end.

thanks,
-- Shuah
