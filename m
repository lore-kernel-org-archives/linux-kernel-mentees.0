From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 18 Jun 2019 09:04:36 -0600
Subject: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
 x86-laptop-drivers.txt to reST
In-Reply-To: <20190618133948.GB5416@kroah.com>
References: <20190618053227.31678-1-puranjay12@gmail.com>
	<20190618054158.GA3713@kroah.com> <20190618071717.2132a1b7@lwn.net>
	<20190618133948.GB5416@kroah.com>
Message-ID: <8aeb222a-ee44-4125-45fd-ce9a741e7ecc@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/18/19 7:39 AM, Greg KH wrote:
> On Tue, Jun 18, 2019 at 07:17:17AM -0600, Jonathan Corbet wrote:
>> On Tue, 18 Jun 2019 07:41:58 +0200
>> Greg KH <gregkh at linuxfoundation.org> wrote:
>>
>>> On Tue, Jun 18, 2019 at 11:02:27AM +0530, Puranjay Mohan wrote:
>>>> This converts the plain text documentation to reStructuredText format.
>>>> No essential content change.
>>>>
>>>> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
>>>> ---
>>>>   Documentation/platform/x86-laptop-drivers.rst | 23 +++++++++++++++++++
>>>>   Documentation/platform/x86-laptop-drivers.txt | 18 ---------------
>>>>   2 files changed, 23 insertions(+), 18 deletions(-)
>>>>   create mode 100644 Documentation/platform/x86-laptop-drivers.rst
>>>>   delete mode 100644 Documentation/platform/x86-laptop-drivers.txt
>>>
>>> Don't you also need to hook it up to the documentation build process
>>> when doing this?
>>
>> Hooking it into the TOC tree is a good thing, but I think it's also good
>> to think about the exercise in general.  This is a document dropped into
>> place five years ago and never touched again.  It's a short list of
>> seemingly ancient laptops with no explanation of what it means.  So the
>> real question, IMO, is whether this document is useful to anybody and, if
>> not, whether it should just be deleted instead.
> 
> I bet it should be deleted, but we should ask the platform driver
> maintainers first before we do that :)
> 

Adding Platform driver maintainers Darren Hart and Andy Shevchenko, and
Compal laptop maintainer Cezary Jackiewicz to the discussion.

+ platform-driver-x86 at vger.kernel.org

Hi Darren, Andy, and Cezary,

Would it be okay to remove the x86-laptop-drivers.txt or should it be
converted to .rst and kept around?

thanks,
-- Shuah
